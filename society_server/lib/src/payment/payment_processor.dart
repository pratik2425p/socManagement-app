import 'package:serverpod/serverpod.dart';
import '../audit/audit_service.dart';
import '../generated/protocol.dart';

/// Idempotent, Transactional Payment Fulfillment Service
class PaymentProcessor {
  PaymentProcessor._();

  /// Atomically confirms payment, updates bill, posts double-entry ledger,
  /// and writes server audit log within a single DB transaction.
  /// Fully idempotent: replayed calls / replayed webhooks never double-credit.
  static Future<PaymentVerificationResult> processSuccessfulPayment(
    Session session, {
    required String orderId,
    required String paymentId,
    required String signature,
    String? paymentMethod,
    int? actorId,
    String? actorName,
    UserRole? actorRole,
  }) async {
    // 1. Check existing transaction state for idempotency
    var txRecord = await PaymentTransaction.db.findFirstRow(
      session,
      where: (t) => t.orderId.equals(orderId),
    );

    if (txRecord != null && txRecord.isProcessed) {
      final existingBill = await MaintenanceBill.db.findById(session, txRecord.billId);
      final existingRecord = await PaymentRecord.db.findFirstRow(
        session,
        where: (t) => t.billId.equals(txRecord.billId),
      );
      return PaymentVerificationResult(
        success: true,
        message: 'Payment already processed (idempotent)',
        isAlreadyProcessed: true,
        paymentRecord: existingRecord,
        bill: existingBill,
      );
    }

    // 2. Also check if paymentId was already recorded in PaymentRecord
    final duplicatePayment = await PaymentRecord.db.findFirstRow(
      session,
      where: (t) => t.transactionReference.equals(paymentId),
    );
    if (duplicatePayment != null) {
      final existingBill = await MaintenanceBill.db.findById(session, duplicatePayment.billId);
      return PaymentVerificationResult(
        success: true,
        message: 'Payment already recorded (idempotent)',
        isAlreadyProcessed: true,
        paymentRecord: duplicatePayment,
        bill: existingBill,
      );
    }

    // 3. Resolve bill associated with transaction
    if (txRecord == null) {
      return PaymentVerificationResult(
        success: false,
        message: 'Transaction for order $orderId not found',
        isAlreadyProcessed: false,
      );
    }

    final bill = await MaintenanceBill.db.findById(session, txRecord.billId);
    if (bill == null) {
      return PaymentVerificationResult(
        success: false,
        message: 'Associated bill ${txRecord.billId} not found',
        isAlreadyProcessed: false,
      );
    }

    // 4. Atomic Execution inside single PostgreSQL transaction
    final result = await session.db.transaction((tx) async {
      // A. Mark Bill as Paid
      bill.status = BillStatus.paid;
      final updatedBill = await MaintenanceBill.db.updateRow(
        session,
        bill,
        transaction: tx,
      );

      // B. Create PaymentRecord
      final receiptNum = 'RCP-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}';
      final totalAmount = txRecord.amount;

      final paymentRecord = PaymentRecord(
        societyId: bill.societyId,
        billId: bill.id!,
        flatId: bill.flatId,
        flatNumber: bill.flatNumber,
        payerName: actorName ?? 'Resident Member',
        amount: totalAmount,
        paymentMethod: paymentMethod ?? 'Razorpay (Test Mode)',
        transactionReference: paymentId,
        receiptNumber: receiptNum,
        paymentDate: DateTime.now(),
        isVerified: true,
      );
      final recorded = await PaymentRecord.db.insertRow(
        session,
        paymentRecord,
        transaction: tx,
      );

      // C. Post balanced LedgerEntry (totalDebit == totalCredit)
      final ledgerEntry = LedgerEntry(
        societyId: bill.societyId,
        entryNumber: 'JE-COL-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
        voucherId: 0,
        entryDate: DateTime.now(),
        description: 'Maintenance Collection: Flat ${bill.flatNumber} (Razorpay - $paymentId, Receipt: $receiptNum)',
        postedByName: 'Razorpay Auto-Reconciliation',
        totalDebit: totalAmount,
        totalCredit: totalAmount,
        postedAt: DateTime.now(),
      );
      await LedgerEntry.db.insertRow(
        session,
        ledgerEntry,
        transaction: tx,
      );

      // D. Append-only server-side Audit Log
      await AuditService.record(
        session,
        societyId: bill.societyId,
        category: AuditCategory.financial,
        action: 'MAINTENANCE_PAID',
        actorId: actorId,
        actorName: actorName ?? 'Resident Member',
        actorRole: actorRole ?? UserRole.resident,
        target: 'Bill ${bill.billNumber} (${bill.flatNumber})',
        description: 'Payment of ₹${totalAmount.toStringAsFixed(2)} verified via Razorpay ($paymentId). Receipt: $receiptNum',
        transaction: tx,
      );

      // E. Update PaymentTransaction status
      txRecord.status = PaymentTransactionStatus.captured;
      txRecord.razorpayPaymentId = paymentId;
      txRecord.razorpaySignature = signature;
      txRecord.receiptNumber = receiptNum;
      txRecord.isProcessed = true;
      txRecord.updatedAt = DateTime.now();

      await PaymentTransaction.db.updateRow(
        session,
        txRecord,
        transaction: tx,
      );

      return PaymentVerificationResult(
        success: true,
        message: 'Payment verified and posted to ledger',
        isAlreadyProcessed: false,
        paymentRecord: recorded,
        bill: updatedBill,
      );
    });

    return result;
  }
}
