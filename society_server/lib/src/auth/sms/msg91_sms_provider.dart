import 'dart:convert';
import 'dart:io';
import 'sms_provider.dart';

/// Production SMS Provider for MSG91 OTP Gateway.
class Msg91SmsProvider implements SmsProvider {
  final String authKey;
  final String templateId;
  final String senderId;

  Msg91SmsProvider({
    required this.authKey,
    required this.templateId,
    this.senderId = 'SOCMGT',
  });

  @override
  Future<bool> sendOtp({
    required String phoneNumber,
    required String otp,
    required Duration expiry,
  }) async {
    if (authKey.isEmpty || templateId.isEmpty) {
      throw StateError('MSG91 is not configured. Missing authKey or templateId.');
    }

    // MSG91 expects country code + phone without '+'
    var formattedPhone = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    if (formattedPhone.length == 10) {
      formattedPhone = '91$formattedPhone';
    }

    final uri = Uri.parse(
      'https://control.msg91.com/api/v5/otp?template_id=$templateId&mobile=$formattedPhone&authkey=$authKey&otp=$otp&expiry=${expiry.inMinutes}',
    );

    final client = HttpClient();
    try {
      final request = await client.postUrl(uri);
      request.headers.set('Content-Type', 'application/json');
      request.headers.set('authkey', authKey);
      final response = await request.close();

      final body = await response.transform(utf8.decoder).join();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(body) as Map<String, dynamic>;
        return data['type'] != 'error';
      }
      return false;
    } finally {
      client.close();
    }
  }
}
