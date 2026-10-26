import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../core/config/app_config.dart';
import '../../screens/dashboard/resident/modals/razorpay_checkout_dialog.dart';
import 'demo_gateway_dialog.dart';

/// Payment gateway abstraction interface.
abstract class PaymentGateway {
  Future<RazorpayCheckoutResult?> openCheckout(
    BuildContext context,
    RazorpayOrderResponse order,
  );
}

/// Real Razorpay implementation connecting to the live/test Razorpay SDK or test modal.
class RazorpayGateway implements PaymentGateway {
  @override
  Future<RazorpayCheckoutResult?> openCheckout(
    BuildContext context,
    RazorpayOrderResponse order,
  ) async {
    if (!AppConfig.isRazorpayConfigured && !AppConfig.isDemoPayment) {
      return const RazorpayCheckoutResult(
        outcome: RazorpayOutcome.failed,
        errorMessage: 'Payments not configured: Razorpay API keys are missing.',
      );
    }
    return RazorpayCheckoutDialog.show(context, order);
  }
}

/// Simulated Demo Gateway for offline walkthroughs and testing without real credentials.
class DemoGateway implements PaymentGateway {
  DemoGateway() {
    if (kReleaseMode) {
      throw StateError('DemoGateway is strictly prohibited in release builds.');
    }
  }

  @override
  Future<RazorpayCheckoutResult?> openCheckout(
    BuildContext context,
    RazorpayOrderResponse order,
  ) {
    if (kReleaseMode) {
      throw StateError('DemoGateway is strictly prohibited in release builds.');
    }
    return DemoGatewayDialog.show(context, order);
  }
}

/// Factory to resolve the active payment gateway
class PaymentGatewayFactory {
  PaymentGatewayFactory._();

  static PaymentGateway getGateway() {
    if (AppConfig.isDemoPayment) {
      return DemoGateway();
    }
    return RazorpayGateway();
  }
}
