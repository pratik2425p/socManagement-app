import 'package:flutter/material.dart';
import '../../../../core/core.dart';

/// Modal result sheet displaying QR verification success or rejection details
class ScannerResultSheet extends StatelessWidget {
  final bool isSuccess;
  final String title;
  final String subtitle;
  final String? flatNumber;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onDismiss;

  const ScannerResultSheet({
    super.key,
    required this.isSuccess,
    required this.title,
    required this.subtitle,
    this.flatNumber,
    required this.icon,
    required this.iconColor,
    required this.onDismiss,
  });

  static Future<void> show({
    required BuildContext context,
    required bool isSuccess,
    required String title,
    required String subtitle,
    String? flatNumber,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onDismiss,
  }) {
    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (ctx) => ScannerResultSheet(
        isSuccess: isSuccess,
        title: title,
        subtitle: subtitle,
        flatNumber: flatNumber,
        icon: icon,
        iconColor: iconColor,
        onDismiss: onDismiss,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: AppSpacing.insetAllLg,
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceElevatedDark : Colors.white,
        borderRadius: AppRadii.borderXl,
        boxShadow: AppShadows.elevated(context),
        border: Border.all(
          color: isSuccess ? AppColors.success : AppColors.error,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 48),
          ),
          AppSpacing.vGapMd,
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: iconColor,
              letterSpacing: 0.5,
            ),
          ),
          AppSpacing.vGapXs,
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
          if (flatNumber != null) ...[
            AppSpacing.vGapMd,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryNavy.withValues(alpha: 0.08),
                borderRadius: AppRadii.borderSm,
              ),
              child: Text(
                'DESTINATION: FLAT $flatNumber',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1,
                  color: AppColors.primaryNavy,
                ),
              ),
            ),
          ],
          AppSpacing.vGapLg,
          AppButton(
            label: isSuccess ? 'Scan Next Pass' : 'Try Again',
            icon: isSuccess ? Icons.qr_code_scanner_rounded : Icons.refresh_rounded,
            isFullWidth: true,
            variant: isSuccess ? AppButtonVariant.primary : AppButtonVariant.secondary,
            onPressed: () {
              Navigator.pop(context);
              onDismiss();
            },
          ),
        ],
      ),
    );
  }
}
