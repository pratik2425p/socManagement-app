import 'package:flutter/foundation.dart';

/// Clean, human-readable terminal logger for local development and debugging
class AppLogger {
  const AppLogger._();

  static const String _line = '══════════════════════════════════════════════════════════════';

  /// Pretty-prints a boxed banner with key-value rows to the Flutter debug console
  static void printBox({
    required String title,
    required Map<String, String> rows,
    String icon = '📌',
  }) {
    if (kReleaseMode) return;

    final buffer = StringBuffer();
    buffer.writeln('\n╔$_line╗');
    final header = '║ $icon ${title.toUpperCase()}'.padRight(63);
    buffer.writeln('$header║');
    buffer.writeln('╠$_line╣');
    for (final entry in rows.entries) {
      final key = entry.key.padRight(14);
      final value = entry.value;
      final row = '║  $key: $value'.padRight(63);
      buffer.writeln('$row║');
    }
    buffer.writeln('╚$_line╝\n');

    debugPrint(buffer.toString());
  }

  /// Formatted OTP dispatch log
  static void otpDispatched({
    required String phone,
    required String otp,
    int expiryMinutes = 5,
    String? statusMessage,
  }) {
    final rows = <String, String>{
      'Phone Number': '+91 $phone',
      'OTP Code': '$otp (Master Dev Code)',
      'Validity': '$expiryMinutes Minutes',
    };
    if (statusMessage != null) rows['Status'] = statusMessage;

    printBox(
      title: 'SMS OTP DISPATCHED',
      icon: '📱',
      rows: rows,
    );
  }

  /// Formatted Authentication Success log
  static void authSuccess({
    required String fullName,
    required String role,
    String? flatNumber,
    String? societyName,
    required String phone,
  }) {
    final rows = <String, String>{
      'User Name': fullName,
      'Role': role.toUpperCase(),
      'Flat Number': (flatNumber != null && flatNumber.isNotEmpty) ? flatNumber : 'N/A',
      'Phone Number': '+91 $phone',
    };
    if (societyName != null) rows['Society'] = societyName;

    printBox(
      title: 'AUTHENTICATION SUCCESSFUL',
      icon: '✅',
      rows: rows,
    );
  }

  /// Formatted Authentication Failure log
  static void authFailed({
    required String phone,
    required String otp,
    required String reason,
    int? attemptsRemaining,
  }) {
    printBox(
      title: 'AUTHENTICATION FAILED',
      icon: '❌',
      rows: {
        'Phone Number': '+91 $phone',
        'Code Tried': otp,
        'Reason': reason,
        if (attemptsRemaining != null) 'Attempts Left': attemptsRemaining.toString(),
      },
    );
  }

  /// Formatted Sign-Out log
  static void signedOut({
    required String userName,
    required String role,
  }) {
    printBox(
      title: 'USER SIGNED OUT',
      icon: '🚪',
      rows: {
        'User Name': userName,
        'Role': role.toUpperCase(),
      },
    );
  }
}
