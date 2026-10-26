import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';

enum RazorpayOutcome { success, failed, pending, cancelled }

class RazorpayCheckoutResult {
  final RazorpayOutcome outcome;
  final String? paymentId;
  final String? signature;
  final String? errorMessage;

  const RazorpayCheckoutResult({
    required this.outcome,
    this.paymentId,
    this.signature,
    this.errorMessage,
  });
}

/// Razorpay Test Checkout Modal supporting Success, Failed, Pending, and Cancelled states
class RazorpayCheckoutDialog extends StatelessWidget {
  final RazorpayOrderResponse order;

  const RazorpayCheckoutDialog({super.key, required this.order});

  static Future<RazorpayCheckoutResult?> show(
    BuildContext context,
    RazorpayOrderResponse order,
  ) {
    return showModalBottomSheet<RazorpayCheckoutResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => RazorpayCheckoutDialog(order: order),
    );
  }

  void _completeWithSuccess(BuildContext context) {
    final paymentId = 'pay_rzp_${DateTime.now().millisecondsSinceEpoch}';
    // Compute valid test signature using default test secret: HMAC-SHA256("$orderId|$paymentId", secret)
    const secret = 'rzp_test_secret_123456789';
    final hmac = Hmac(sha256, utf8.encode(secret));
    final signature = hmac.convert(utf8.encode('${order.orderId}|$paymentId')).toString();

    Navigator.pop(
      context,
      RazorpayCheckoutResult(
        outcome: RazorpayOutcome.success,
        paymentId: paymentId,
        signature: signature,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.xl),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Drag Handle & Close
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primaryNavy,
                        borderRadius: AppRadii.borderSm,
                      ),
                      child: const Text(
                        'Razorpay',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    AppSpacing.hGapSm,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: AppRadii.borderSm,
                      ),
                      child: Text(
                        'TEST MODE',
                        style: TextStyle(color: Colors.amber.shade900, fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () => Navigator.pop(
                    context,
                    const RazorpayCheckoutResult(outcome: RazorpayOutcome.cancelled),
                  ),
                ),
              ],
            ),
            const Divider(),
            AppSpacing.vGapSm,

            // Order & Amount Summary
            Text('Paying for Maintenance Bill', style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
            AppSpacing.vGapXs,
            Text(
              '₹${order.amountRupees.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.accentTeal),
            ),
            AppSpacing.vGapXs,
            Text('Order ID: ${order.orderId}', style: const TextStyle(fontSize: 11, fontFamily: 'monospace')),
            Text('Flat: ${order.flatNumber}  •  ${order.payerName}', style: const TextStyle(fontSize: 11)),
            AppSpacing.vGapLg,

            // Test Action Buttons
            Text(
              'Select Test Checkout Outcome:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
            ),
            AppSpacing.vGapMd,

            // 1. Success
            AppButton.primary(
              label: 'Simulate Payment Success',
              icon: Icons.check_circle_rounded,
              isFullWidth: true,
              onPressed: () => _completeWithSuccess(context),
            ),
            AppSpacing.vGapSm,

            // 2. Failure
            AppButton.destructive(
              label: 'Simulate Bank Decline / Failure',
              icon: Icons.cancel_rounded,
              isFullWidth: true,
              onPressed: () => Navigator.pop(
                context,
                const RazorpayCheckoutResult(
                  outcome: RazorpayOutcome.failed,
                  errorMessage: 'Payment was declined by the issuing bank (Test Simulation).',
                ),
              ),
            ),
            AppSpacing.vGapSm,

            // 3. Pending
            AppButton.secondary(
              label: 'Simulate Payment Pending',
              icon: Icons.hourglass_top_rounded,
              isFullWidth: true,
              onPressed: () => Navigator.pop(
                context,
                const RazorpayCheckoutResult(
                  outcome: RazorpayOutcome.pending,
                  errorMessage: 'Payment is awaiting clearance from your bank.',
                ),
              ),
            ),
            AppSpacing.vGapSm,

            // 4. Cancel
            AppButton.text(
              label: 'Cancel Payment Session',
              isFullWidth: true,
              onPressed: () => Navigator.pop(
                context,
                const RazorpayCheckoutResult(outcome: RazorpayOutcome.cancelled),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
