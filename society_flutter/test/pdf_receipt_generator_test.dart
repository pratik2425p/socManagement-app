import 'package:flutter_test/flutter_test.dart';
import 'package:society_client/society_client.dart';
import 'package:society_flutter/core/utils/pdf_receipt_generator.dart';

void main() {
  group('PDF Receipt Generator Tests', () {
    late MaintenanceBill testBill;
    late PaymentRecord testRecord;
    late Society testSociety;

    setUp(() {
      testSociety = Society(
        name: 'Shree Samarth Residency Co-op Hsg Soc Ltd',
        code: 'SSR01',
        address: 'Bhelke Nagar, Kothrud',
        city: 'Pune',
        state: 'Maharashtra',
        pincode: '411038',
        totalFlats: 120,
        subscriptionPlan: 'enterprise',
        subscriptionStatus: 'active',
        registrationNumber: 'MAH/PUN/2021/45678',
        gstin: '27AABCU9603R1ZM',
        createdAt: DateTime.now(),
      );

      testBill = MaintenanceBill(
        societyId: 1,
        flatId: 101,
        flatNumber: 'A-304',
        billNumber: 'BILL-OCT-2026-A304',
        billingMonth: 'October 2026',
        dueDate: DateTime.now().add(const Duration(days: 10)),
        amount: 2450.0,
        lateFee: 150.0,
        status: BillStatus.paid,
        issuedAt: DateTime.now(),
      );

      testRecord = PaymentRecord(
        societyId: 1,
        billId: 1,
        flatId: 101,
        flatNumber: 'A-304',
        payerName: 'Vicky Patil',
        amount: 2600.0,
        paymentMethod: 'Razorpay UPI',
        transactionReference: 'pay_rzp_test_12345678',
        receiptNumber: 'RCP-2026-987654',
        paymentDate: DateTime.now(),
        isVerified: true,
      );
    });

    test('generates valid non-empty A4 receipt PDF', () async {
      final bytes = await PdfReceiptGenerator.generateReceiptPdf(
        bill: testBill,
        record: testRecord,
        society: testSociety,
        format: ReceiptFormat.a4,
      );

      expect(bytes, isNotEmpty);
      // PDF documents start with %PDF
      final header = String.fromCharCodes(bytes.sublist(0, 4));
      expect(header, equals('%PDF'));
    });

    test('generates valid non-empty 80mm thermal receipt PDF', () async {
      final bytes = await PdfReceiptGenerator.generateReceiptPdf(
        bill: testBill,
        record: testRecord,
        society: testSociety,
        format: ReceiptFormat.thermal80mm,
      );

      expect(bytes, isNotEmpty);
      final header = String.fromCharCodes(bytes.sublist(0, 4));
      expect(header, equals('%PDF'));
    });
  });
}
