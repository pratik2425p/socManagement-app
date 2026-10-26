import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:society_client/society_client.dart';
import 'package:society_flutter/screens/dashboard/resident/modals/razorpay_checkout_dialog.dart';
import 'package:society_flutter/services/payment/demo_gateway_dialog.dart';

void main() {
  group('DemoGatewayDialog Simulator Tests', () {
    final testOrder = RazorpayOrderResponse(
      orderId: 'order_demo_test_999',
      billId: 1,
      societyId: 1,
      amountPaise: 350000,
      amountRupees: 3500.0,
      currency: 'INR',
      keyId: 'rzp_test_demo',
      billNumber: 'BILL-001',
      flatNumber: 'A-402',
      payerName: 'Rajesh Deshmukh',
      payerPhone: '9822334455',
      payerEmail: 'resident@greenwoods.in',
    );

    testWidgets('renders payment tabs and pay button with formatted amount', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DemoGatewayDialog(order: testOrder),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('SIMULATED DEMO GATEWAY'), findsOneWidget);
      expect(find.text('UPI / QR'), findsOneWidget);
      expect(find.text('Cards'), findsOneWidget);
      expect(find.text('NetBanking'), findsOneWidget);
      expect(find.textContaining('Simulate Payment Success'), findsOneWidget);
      expect(find.text('Simulation Test Selector:'), findsOneWidget);
    });

    testWidgets('simulates payment success outcome by default', (tester) async {
      RazorpayCheckoutResult? result;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (ctx) => ElevatedButton(
                onPressed: () async {
                  result = await showModalBottomSheet<RazorpayCheckoutResult>(
                    context: ctx,
                    isScrollControlled: true,
                    builder: (_) => DemoGatewayDialog(order: testOrder),
                  );
                },
                child: const Text('Open Checkout'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Checkout'));
      await tester.pumpAndSettle();

      // Tap Pay button
      await tester.tap(find.textContaining('Simulate Payment Success'));
      // Advance through processing timer
      await tester.pump(const Duration(milliseconds: 900));
      await tester.pumpAndSettle();

      expect(result, isNotNull);
      expect(result!.outcome, RazorpayOutcome.success);
      expect(result!.paymentId, startsWith('pay_demo_'));
      expect(result!.signature, isNotNull);
    });

    testWidgets('simulates payment failure outcome when Failure pill selected', (tester) async {
      RazorpayCheckoutResult? result;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (ctx) => ElevatedButton(
                onPressed: () async {
                  result = await showModalBottomSheet<RazorpayCheckoutResult>(
                    context: ctx,
                    isScrollControlled: true,
                    builder: (_) => DemoGatewayDialog(order: testOrder),
                  );
                },
                child: const Text('Open Checkout'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Checkout'));
      await tester.pumpAndSettle();

      // Select Failure simulator chip
      await tester.tap(find.text('Failure'));
      await tester.pumpAndSettle();

      // Tap Pay button
      await tester.tap(find.text('Simulate FAILED'));
      await tester.pump(const Duration(milliseconds: 900));
      await tester.pumpAndSettle();

      expect(result, isNotNull);
      expect(result!.outcome, RazorpayOutcome.failed);
      expect(result!.errorMessage, contains('Simulated'));
    });

    testWidgets('simulates pending outcome when Pending pill selected', (tester) async {
      RazorpayCheckoutResult? result;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (ctx) => ElevatedButton(
                onPressed: () async {
                  result = await showModalBottomSheet<RazorpayCheckoutResult>(
                    context: ctx,
                    isScrollControlled: true,
                    builder: (_) => DemoGatewayDialog(order: testOrder),
                  );
                },
                child: const Text('Open Checkout'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Checkout'));
      await tester.pumpAndSettle();

      // Select Pending simulator chip
      await tester.tap(find.text('Pending'));
      await tester.pumpAndSettle();

      // Tap Pay button
      await tester.tap(find.text('Simulate PENDING'));
      await tester.pump(const Duration(milliseconds: 900));
      await tester.pumpAndSettle();

      expect(result, isNotNull);
      expect(result!.outcome, RazorpayOutcome.pending);
    });
  });
}
