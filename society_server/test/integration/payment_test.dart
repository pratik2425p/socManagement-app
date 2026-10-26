import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:society_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given Razorpay Payment, Webhook Verification and Auto-Reconciliation', (
    sessionBuilder,
    endpoints,
  ) {
    late Society testSociety;
    late SocietyUser residentUser;
    late MaintenanceBill testBill;
    const testPhone = '9822011223';
    const razorpayKeySecret = 'rzp_test_secret_123456789';
    const razorpayWebhookSecret = 'whsec_society_test_secret_987654321';

    setUpAll(() async {
      AuthServices.set(
        tokenManagerBuilders: [
          JwtConfigFromPasswords(),
        ],
      );
    });

    setUp(() async {
      final session = sessionBuilder.build();

      // Clean test tables
      await PaymentTransaction.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await PaymentRecord.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await LedgerEntry.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await AuditLog.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await MaintenanceBill.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await SocietyUser.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await Society.db.deleteWhere(session, where: (_) => Constant.bool(true));

      testSociety = await Society.db.insertRow(
        session,
        Society(
          name: 'Shree Samarth Residency',
          code: 'SSR01',
          address: 'Pune West',
          city: 'Pune',
          state: 'Maharashtra',
          pincode: '411001',
          totalFlats: 100,
          subscriptionPlan: 'pro',
          subscriptionStatus: 'active',
          registrationNumber: 'MAH/PUN/2020/1234',
          gstin: '27AABCU9603R1ZM',
          createdAt: DateTime.now(),
        ),
      );

      residentUser = await SocietyUser.db.insertRow(
        session,
        SocietyUser(
          societyId: testSociety.id!,
          fullName: 'Pooja Deshmukh',
          phone: testPhone,
          email: 'pooja@samarth.in',
          role: UserRole.resident,
          flatNumber: 'B-204',
          status: 'active',
          createdAt: DateTime.now(),
        ),
      );

      testBill = await MaintenanceBill.db.insertRow(
        session,
        MaintenanceBill(
          societyId: testSociety.id!,
          flatId: 101,
          flatNumber: 'B-204',
          billNumber: 'BILL-OCT-2026-B204',
          billingMonth: 'October 2026',
          dueDate: DateTime.now().add(const Duration(days: 15)),
          amount: 2500.0,
          lateFee: 150.0,
          status: BillStatus.unpaid,
          issuedAt: DateTime.now(),
        ),
      );
    });

    TestSessionBuilder createResidentSessionBuilder() {
      return sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          residentUser.phone,
          {},
        ),
      );
    }

    test('The server creates the order, and the amount is computed server-side from the bill', () async {
      final userSession = createResidentSessionBuilder();

      final order = await endpoints.payment.createPaymentOrder(userSession, testBill.id!);

      expect(order.billId, equals(testBill.id));
      expect(order.societyId, equals(testSociety.id));
      // Total amount = amount (2500) + lateFee (150) = 2650
      expect(order.amountRupees, equals(2650.0));
      expect(order.amountPaise, equals(265000));
      expect(order.billNumber, equals('BILL-OCT-2026-B204'));
      expect(order.flatNumber, equals('B-204'));
      expect(order.currency, equals('INR'));
      expect(order.orderId.isNotEmpty, isTrue);

      final dbSession = sessionBuilder.build();
      // Verify transaction row was saved to database
      final tx = await PaymentTransaction.db.findFirstRow(
        dbSession,
        where: (t) => t.orderId.equals(order.orderId),
      );
      expect(tx, isNotNull);
      expect(tx!.status, equals(PaymentTransactionStatus.created));
      expect(tx.isProcessed, isFalse);
    });

    test('Payment signature rejection on invalid signature', () async {
      final userSession = createResidentSessionBuilder();
      final order = await endpoints.payment.createPaymentOrder(userSession, testBill.id!);

      final result = await endpoints.payment.verifyPayment(
        userSession,
        order.orderId,
        'pay_test_invalid_123',
        'invalid_signature_hex_value',
      );

      expect(result.success, isFalse);
      expect(result.message, contains('signature'));

      // Bill remains unpaid
      final dbSession = sessionBuilder.build();
      final bill = await MaintenanceBill.db.findById(dbSession, testBill.id!);
      expect(bill!.status, equals(BillStatus.unpaid));
    });

    test('Payment success changes bill to Paid, creates balanced ledger entry and writes audit log in one transaction', () async {
      final userSession = createResidentSessionBuilder();
      final order = await endpoints.payment.createPaymentOrder(userSession, testBill.id!);

      const paymentId = 'pay_real_987654';
      // Compute valid Razorpay checkout signature: HMAC-SHA256("$orderId|$paymentId", keySecret)
      final hmac = Hmac(sha256, utf8.encode(razorpayKeySecret));
      final validSignature = hmac.convert(utf8.encode('${order.orderId}|$paymentId')).toString();

      final result = await endpoints.payment.verifyPayment(
        userSession,
        order.orderId,
        paymentId,
        validSignature,
      );

      expect(result.success, isTrue);
      expect(result.isAlreadyProcessed, isFalse);
      expect(result.paymentRecord, isNotNull);

      final dbSession = sessionBuilder.build();

      // 1. Bill must be marked as Paid
      final updatedBill = await MaintenanceBill.db.findById(dbSession, testBill.id!);
      expect(updatedBill!.status, equals(BillStatus.paid));

      // 2. Balanced Ledger Entry exists (debits == credits)
      final ledgerEntries = await LedgerEntry.db.find(
        dbSession,
        where: (t) => t.societyId.equals(testSociety.id!),
      );
      expect(ledgerEntries.length, equals(1));
      final ledger = ledgerEntries.first;
      expect(ledger.totalDebit, equals(2650.0));
      expect(ledger.totalCredit, equals(2650.0));
      expect(ledger.description, contains(paymentId));

      // 3. Append-only server-side Audit Log exists
      final auditLogs = await AuditLog.db.find(
        dbSession,
        where: (t) => t.societyId.equals(testSociety.id!) & t.action.equals('MAINTENANCE_PAID'),
      );
      expect(auditLogs.length, equals(1));
      expect(auditLogs.first.category, equals(AuditCategory.financial));
      expect(auditLogs.first.target, contains('BILL-OCT-2026-B204'));
    });

    test('Webhook signature rejection when signature does not match secret', () async {
      const payload = '{"event":"payment.captured","payload":{"payment":{"entity":{"id":"pay_bad"}}}}';
      final result = await endpoints.payment.handleWebhook(sessionBuilder, payload, 'fake_invalid_sig');

      expect(result.success, isFalse);
      expect(result.message, contains('Invalid webhook signature'));
    });

    test('Webhook idempotency: replayed webhook never double-credits or duplicates ledger entries', () async {
      final residentSession = createResidentSessionBuilder();
      final order = await endpoints.payment.createPaymentOrder(residentSession, testBill.id!);

      const paymentId = 'pay_wh_idempotent_123';

      final webhookPayload = jsonEncode({
        'event': 'payment.captured',
        'payload': {
          'payment': {
            'entity': {
              'id': paymentId,
              'order_id': order.orderId,
              'amount': 265000,
              'status': 'captured',
            },
          },
        },
      });

      // Compute valid webhook signature: HMAC-SHA256(rawPayload, webhookSecret)
      final hmac = Hmac(sha256, utf8.encode(razorpayWebhookSecret));
      final validWebhookSig = hmac.convert(utf8.encode(webhookPayload)).toString();

      // First webhook delivery
      final firstResult = await endpoints.payment.handleWebhook(
        sessionBuilder,
        webhookPayload,
        validWebhookSig,
      );
      expect(firstResult.success, isTrue);
      expect(firstResult.isProcessed, isFalse);

      final dbSession = sessionBuilder.build();

      // Verify bill, ledger and payment record were created
      final billAfterFirst = await MaintenanceBill.db.findById(dbSession, testBill.id!);
      expect(billAfterFirst!.status, equals(BillStatus.paid));

      final ledgerCount1 = (await LedgerEntry.db.find(dbSession, where: (t) => t.societyId.equals(testSociety.id!))).length;
      final auditCount1 = (await AuditLog.db.find(dbSession, where: (t) => t.societyId.equals(testSociety.id!))).length;
      final paymentCount1 = (await PaymentRecord.db.find(dbSession, where: (t) => t.billId.equals(testBill.id!))).length;

      expect(ledgerCount1, equals(1));
      expect(auditCount1, equals(1));
      expect(paymentCount1, equals(1));

      // Replayed webhook delivery (same payload and signature)
      final replayedResult = await endpoints.payment.handleWebhook(
        sessionBuilder,
        webhookPayload,
        validWebhookSig,
      );

      expect(replayedResult.success, isTrue);
      expect(replayedResult.isProcessed, isTrue); // Flagged as already processed!

      // Verify no duplicates occurred in ledger, audit log, or payment records
      final ledgerCount2 = (await LedgerEntry.db.find(dbSession, where: (t) => t.societyId.equals(testSociety.id!))).length;
      final auditCount2 = (await AuditLog.db.find(dbSession, where: (t) => t.societyId.equals(testSociety.id!))).length;
      final paymentCount2 = (await PaymentRecord.db.find(dbSession, where: (t) => t.billId.equals(testBill.id!))).length;

      expect(ledgerCount2, equals(1)); // Still exactly 1
      expect(auditCount2, equals(1));  // Still exactly 1
      expect(paymentCount2, equals(1)); // Still exactly 1
    });
  });
}
