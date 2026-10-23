import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class MaintenanceEndpoint extends Endpoint {
  /// Get all maintenance bills for a society, optionally filtered by flat
  Future<List<MaintenanceBill>> getBills(
    Session session,
    int societyId, {
    String? flatNumber,
  }) async {
    return await MaintenanceBill.db.find(
      session,
      where: (t) =>
          t.societyId.equals(societyId) &
          (flatNumber != null ? t.flatNumber.equals(flatNumber) : Constant.bool(true)),
      orderBy: (t) => t.dueDate,
      orderDescending: true,
    );
  }

  /// Generate/Create a maintenance bill
  Future<MaintenanceBill> createBill(Session session, MaintenanceBill bill) async {
    return await MaintenanceBill.db.insertRow(session, bill);
  }

  /// Record a payment against maintenance & auto-reconcile to General Ledger
  Future<PaymentRecord> recordPayment(Session session, PaymentRecord payment) async {
    final recorded = await PaymentRecord.db.insertRow(session, payment);

    // Update bill status if billId exists
    final bill = await MaintenanceBill.db.findById(session, payment.billId);
    if (bill != null) {
      bill.status = BillStatus.paid;
      await MaintenanceBill.db.updateRow(session, bill);
    }

    // Auto-reconciliation into double-entry accounting ledger
    try {
      final ledgerEntry = LedgerEntry(
        societyId: payment.societyId,
        entryNumber: 'JE-COL-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
        voucherId: 0,
        entryDate: payment.paymentDate,
        description: 'Maintenance Collection: Flat ${payment.flatNumber} (${payment.paymentMethod} - ${payment.receiptNumber})',
        postedByName: 'Auto-Reconciliation Engine',
        totalDebit: payment.amount,
        totalCredit: payment.amount,
        postedAt: DateTime.now(),
      );
      await LedgerEntry.db.insertRow(session, ledgerEntry);
    } catch (e) {
      session.log('[MaintenanceEndpoint] Auto-reconciliation ledger error: $e');
    }

    return recorded;
  }

  /// Get payment history for a society
  Future<List<PaymentRecord>> getPayments(Session session, int societyId) async {
    return await PaymentRecord.db.find(
      session,
      where: (t) => t.societyId.equals(societyId),
      orderBy: (t) => t.paymentDate,
      orderDescending: true,
    );
  }
}
