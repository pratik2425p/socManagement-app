import 'package:flutter/material.dart';
import '../../../core/core.dart';

/// Banner shown when maximum OTP attempts have been reached
class LockoutBanner extends StatelessWidget {
  const LockoutBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        borderRadius: AppRadii.borderMd,
        border: Border.all(color: AppColors.error.withValues(alpha: 0.4)),
      ),
      child: const Row(
        children: [
          Icon(Icons.lock_clock_rounded, color: AppColors.error, size: 28),
          AppSpacing.hGapMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Temporarily Locked',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.error,
                    fontSize: 13,
                  ),
                ),
                AppSpacing.vGapXs,
                Text(
                  'Too many failed attempts. For your security, please wait 15 minutes or request a new code.',
                  style: TextStyle(fontSize: 12, color: AppColors.error),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
