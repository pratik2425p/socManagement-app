import 'dart:io';
import 'sms_provider.dart';

/// Console implementation for local development and integration tests.
class ConsoleSmsProvider implements SmsProvider {
  static String? lastSentPhone;
  static String? lastSentOtp;

  @override
  Future<bool> sendOtp({
    required String phoneNumber,
    required String otp,
    required Duration expiry,
  }) async {
    lastSentPhone = phoneNumber;
    lastSentOtp = otp;

    stdout.writeln('\n========================================');
    stdout.writeln('📱 [SMS OTP DEV CONSOLE]');
    stdout.writeln('To: $phoneNumber');
    stdout.writeln('OTP: $otp');
    stdout.writeln('Valid for: ${expiry.inMinutes} minutes');
    stdout.writeln('========================================\n');

    return true;
  }
}
