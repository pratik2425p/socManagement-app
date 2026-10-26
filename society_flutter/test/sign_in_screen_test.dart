import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:society_flutter/screens/auth/widgets/phone_input_view.dart';
import 'package:society_flutter/screens/auth/widgets/otp_verification_view.dart';

void main() {
  group('SMS OTP Sign-In View Tests', () {
    testWidgets('PhoneInputView displays title, phone field, and send OTP button', (tester) async {
      final controller = TextEditingController();
      bool sendTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PhoneInputView(
              controller: controller,
              isLoading: false,
              onSendOtp: () => sendTapped = true,
              onQuickFill: (p) => controller.text = p,
            ),
          ),
        ),
      );

      expect(find.text('Welcome to Society Connect'), findsOneWidget);
      expect(find.text('Mobile Number'), findsOneWidget);
      expect(find.text('+91'), findsOneWidget);
      expect(find.text('Send OTP'), findsOneWidget);

      await tester.enterText(find.byType(TextFormField), '9822011223');
      expect(controller.text, '9822011223');

      await tester.tap(find.text('Send OTP'));
      expect(sendTapped, isTrue);
    });

    testWidgets('OtpVerificationView renders phone, countdown, and lockout states', (tester) async {
      final pinController = TextEditingController();
      final focusNode = FocusNode();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OtpVerificationView(
              phone: '9822011223',
              pinController: pinController,
              focusNode: focusNode,
              isLoading: false,
              cooldownSeconds: 45,
              attemptsRemaining: 2,
              isLockedOut: false,
              onVerify: (_) {},
              onResend: () {},
              onChangePhone: () {},
            ),
          ),
        ),
      );

      expect(find.text('Enter Verification Code'), findsOneWidget);
      expect(find.text('Code sent to +91 9822011223'), findsOneWidget);
      expect(find.text('2 attempt(s) remaining'), findsOneWidget);
      expect(find.text('Resend in 45s'), findsOneWidget);
      expect(find.text('Verify & Sign In'), findsOneWidget);
    });

    testWidgets('OtpVerificationView displays lockout alert when locked out', (tester) async {
      final pinController = TextEditingController();
      final focusNode = FocusNode();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OtpVerificationView(
              phone: '9822011223',
              pinController: pinController,
              focusNode: focusNode,
              isLoading: false,
              cooldownSeconds: 0,
              isLockedOut: true,
              onVerify: (_) {},
              onResend: () {},
              onChangePhone: () {},
            ),
          ),
        ),
      );

      expect(find.text('Account Temporarily Locked'), findsOneWidget);
      expect(find.text('Change Phone Number'), findsOneWidget);
    });
  });
}
