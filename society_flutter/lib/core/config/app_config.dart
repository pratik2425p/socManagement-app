import 'package:flutter/foundation.dart';

/// Centralized application configuration supporting compile-time `--dart-define` flags.
/// Guarantees that demo mode is physically impossible to activate in production release builds.
class AppConfig {
  AppConfig._();

  /// Flag indicating whether the app is running in offline demo mode.
  /// Defaults to `false`. Always `false` in release mode.
  static const bool isDemoMode =
      !kReleaseMode && bool.fromEnvironment('DEMO_MODE', defaultValue: false);

  /// Payment processing mode: 'demo' or 'razorpay'.
  /// In release mode, 'demo' is strictly prohibited and defaults to 'razorpay'.
  static String get paymentMode {
    if (kReleaseMode) return 'razorpay';
    const envMode = String.fromEnvironment('PAYMENT_MODE', defaultValue: 'razorpay');
    if (isDemoMode) return 'demo';
    return envMode;
  }

  /// Check whether payment mode is set to simulated demo
  static bool get isDemoPayment => !kReleaseMode && paymentMode == 'demo';

  /// Check if Razorpay test/live key is configured
  static bool get isRazorpayConfigured {
    const key = String.fromEnvironment('RAZORPAY_KEY', defaultValue: '');
    // In dev, a placeholder or defined key suffices
    return key.isNotEmpty || isDemoPayment;
  }
}
