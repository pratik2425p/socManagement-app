import 'package:flutter/material.dart';
import '../../../../core/core.dart';

enum PaymentFlowStatus {
  idle,
  creatingOrder,
  verifying,
  failed,
  pending,
  cancelled,
}

/// Visual State Representation for Non-Idle Payment Flow States
class PaymentStatusView extends StatelessWidget {
  final PaymentFlowStatus status;
  final String? errorMessage;
  final VoidCallback onRetry;
  final VoidCallback onCancel;

  const PaymentStatusView({
    super.key,
    required this.status,
    this.errorMessage,
    required this.onRetry,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case PaymentFlowStatus.creatingOrder:
      case PaymentFlowStatus.verifying:
        final msg = status == PaymentFlowStatus.creatingOrder
            ? 'Creating secure Razorpay order...'
            : 'Verifying payment & auto-reconciling with general ledger...';
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: AppColors.accentTeal),
              AppSpacing.vGapLg,
              Text(
                msg,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              AppSpacing.vGapXs,
              const Text(
                'Please do not press back or close the app.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );

      case PaymentFlowStatus.failed:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: const BoxDecoration(
                    color: AppColors.errorContainer,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.error_outline_rounded, color: AppColors.error, size: 40),
                ),
              ),
              AppSpacing.vGapMd,
              const Text(
                'Payment Failed',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.error),
                textAlign: TextAlign.center,
              ),
              AppSpacing.vGapSm,
              Text(
                errorMessage ?? 'The payment could not be processed. No money was debited from your account.',
                style: const TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
              AppSpacing.vGapXl,
              AppButton.primary(
                label: 'Retry Payment',
                icon: Icons.refresh_rounded,
                isFullWidth: true,
                onPressed: onRetry,
              ),
              AppSpacing.vGapSm,
              AppButton.text(
                label: 'Change Method / Cancel',
                isFullWidth: true,
                onPressed: onCancel,
              ),
            ],
          ),
        );

      case PaymentFlowStatus.pending:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: const BoxDecoration(
                    color: AppColors.warningContainer,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.hourglass_empty_rounded, color: AppColors.warningDark, size: 40),
                ),
              ),
              AppSpacing.vGapMd,
              const Text(
                'Payment Processing / Pending',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.warningDark),
                textAlign: TextAlign.center,
              ),
              AppSpacing.vGapSm,
              Text(
                errorMessage ?? 'Your transaction is pending bank authorization. Your bill status will update automatically once confirmed via webhook.',
                style: const TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
              AppSpacing.vGapXl,
              AppButton.secondary(
                label: 'Check Status / Refresh',
                icon: Icons.sync_rounded,
                isFullWidth: true,
                onPressed: onRetry,
              ),
              AppSpacing.vGapSm,
              AppButton.text(
                label: 'Close Window',
                isFullWidth: true,
                onPressed: onCancel,
              ),
            ],
          ),
        );

      case PaymentFlowStatus.cancelled:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.cancel_outlined, color: Colors.grey, size: 40),
                ),
              ),
              AppSpacing.vGapMd,
              const Text(
                'Payment Cancelled',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              AppSpacing.vGapSm,
              const Text(
                'You cancelled the checkout session before completing the payment.',
                style: TextStyle(fontSize: 13, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              AppSpacing.vGapXl,
              AppButton.primary(
                label: 'Resume Payment',
                icon: Icons.payment_rounded,
                isFullWidth: true,
                onPressed: onRetry,
              ),
              AppSpacing.vGapSm,
              AppButton.text(
                label: 'Dismiss',
                isFullWidth: true,
                onPressed: onCancel,
              ),
            ],
          ),
        );

      case PaymentFlowStatus.idle:
        return const SizedBox.shrink();
    }
  }
}
