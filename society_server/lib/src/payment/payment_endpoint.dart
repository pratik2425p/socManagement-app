import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import '../core/auth_context.dart';
import '../generated/protocol.dart';
import 'payment_processor.dart';
import 'razorpay_service.dart';

/// Secure Serverpod Endpoint for Payment Order Creation, Checkout Verification & Webhooks
class PaymentEndpoint extends Endpoint {
  /// Creates a Razorpay payment order.
  /// The amount is strictly computed server-side from the bill record.
  Future<RazorpayOrderResponse> createPaymentOrder(
    Session session,
    int billId,
  ) async {
    final auth = await AuthContext.require(session);

    final bill = await MaintenanceBill.db.findById(session, billId);
    if (bill == null) {
      throw ArgumentError('Maintenance bill $billId not found');
    }

    // Enforce society tenancy & resident flat ownership
    auth.requireSociety(bill.societyId);
    if (auth.user.role == UserRole.resident &&
        auth.user.flatNumber != null &&
        auth.user.flatNumber!.isNotEmpty &&
        bill.flatNumber != auth.user.flatNumber) {
      throw StateError('Residents can only pay bills for their own flat (${auth.user.flatNumber})');
    }

    if (bill.status == BillStatus.paid) {
      throw StateError('Bill ${bill.billNumber} has already been paid');
    }

    // Compute amount server-side
    final totalAmount = bill.amount + bill.lateFee;
    final amountPaise = (totalAmount * 100).round();

    final razorpay = RazorpayService.fromSession(session);
    final orderId = await razorpay.createOrder(
      amountPaise: amountPaise,
      currency: 'INR',
      receipt: 'bill_${bill.id}',
      notes: {
        'billId': bill.id.toString(),
        'billNumber': bill.billNumber,
        'flatNumber': bill.flatNumber,
        'societyId': bill.societyId.toString(),
      },
    );

    // Persist PaymentTransaction record
    final transaction = PaymentTransaction(
      orderId: orderId,
      billId: bill.id!,
      societyId: bill.societyId,
      userId: auth.user.id,
      amount: totalAmount,
      amountPaise: amountPaise,
      currency: 'INR',
      status: PaymentTransactionStatus.created,
      isProcessed: false,
      createdAt: DateTime.now(),
    );
    await PaymentTransaction.db.insertRow(session, transaction);

    return RazorpayOrderResponse(
      orderId: orderId,
      billId: bill.id!,
      societyId: bill.societyId,
      amountPaise: amountPaise,
      amountRupees: totalAmount,
      currency: 'INR',
      keyId: razorpay.keyId,
      billNumber: bill.billNumber,
      flatNumber: bill.flatNumber,
      payerName: auth.user.fullName,
      payerPhone: auth.user.phone,
      payerEmail: auth.user.email,
    );
  }

  /// Verifies checkout payment signature and atomically fulfills the payment.
  Future<PaymentVerificationResult> verifyPayment(
    Session session,
    String orderId,
    String paymentId,
    String signature,
  ) async {
    final auth = await AuthContext.require(session);

    final razorpay = RazorpayService.fromSession(session);
    final isValid = razorpay.verifyPaymentSignature(
      orderId: orderId,
      paymentId: paymentId,
      signature: signature,
    );

    if (!isValid) {
      return PaymentVerificationResult(
        success: false,
        message: 'Payment signature verification failed',
        isAlreadyProcessed: false,
      );
    }

    return await PaymentProcessor.processSuccessfulPayment(
      session,
      orderId: orderId,
      paymentId: paymentId,
      signature: signature,
      actorId: auth.user.id,
      actorName: auth.user.fullName,
      actorRole: auth.user.role,
    );
  }

  /// Handles incoming Razorpay webhook with signature verification and idempotency.
  Future<WebhookResult> handleWebhook(
    Session session,
    String payload,
    String signature,
  ) async {
    final razorpay = RazorpayService.fromSession(session);
    final isValid = razorpay.verifyWebhookSignature(
      payload: payload,
      signature: signature,
    );

    if (!isValid) {
      return WebhookResult(
        success: false,
        message: 'Invalid webhook signature',
        isProcessed: false,
      );
    }

    try {
      final data = jsonDecode(payload) as Map<String, dynamic>;
      final event = data['event'] as String? ?? '';
      final payment = data['payload']?['payment']?['entity'] as Map<String, dynamic>?;
      final order = data['payload']?['order']?['entity'] as Map<String, dynamic>?;

      final paymentId = (payment?['id'] ?? 'pay_wh_${DateTime.now().millisecondsSinceEpoch}').toString();
      final orderId = (payment?['order_id'] ?? order?['id'])?.toString();

      if (orderId == null) {
        return WebhookResult(
          success: true,
          message: 'Ignored webhook event $event (no order_id)',
          isProcessed: false,
        );
      }

      final res = await PaymentProcessor.processSuccessfulPayment(
        session,
        orderId: orderId,
        paymentId: paymentId,
        signature: signature,
        paymentMethod: 'Razorpay Webhook ($event)',
      );

      return WebhookResult(
        success: res.success,
        message: res.message,
        isProcessed: res.isAlreadyProcessed,
        orderId: orderId,
        paymentId: paymentId,
      );
    } catch (e) {
      session.log('[PaymentEndpoint] Webhook parsing error: $e');
      return WebhookResult(
        success: false,
        message: 'Error processing webhook: $e',
        isProcessed: false,
      );
    }
  }
}
