import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/core.dart';

/// Phone Number Entry Form for SMS OTP Authentication
class PhoneInputView extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onSendOtp;
  final ValueChanged<String>? onQuickFill;

  const PhoneInputView({
    super.key,
    required this.controller,
    required this.isLoading,
    this.errorMessage,
    required this.onSendOtp,
    this.onQuickFill,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.xl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. App Identity Header
              FadeSlideIn(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.surfaceElevatedDark : AppColors.primaryContainer,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.accentTeal.withValues(alpha: 0.3),
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.apartment_rounded,
                          size: 32,
                          color: AppColors.accentTeal,
                        ),
                      ),
                    ),
                    AppSpacing.vGapMd,
                    Text(
                      'Welcome to Society Connect',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    AppSpacing.vGapXs,
                    Text(
                      'Enter your 10-digit mobile number to sign in with a secure one-time passcode.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              AppSpacing.vGapXl,

              // 2. Phone Input Form Card
              AppCard(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Mobile Number',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                    ),
                    AppSpacing.vGapSm,
                    TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.phone_iphone_rounded, size: 20),
                              AppSpacing.hGapXs,
                              Text(
                                '+91',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                                ),
                              ),
                              AppSpacing.hGapXs,
                              Container(
                                width: 1,
                                height: 20,
                                color: isDark ? AppColors.borderDark : AppColors.borderLight,
                              ),
                            ],
                          ),
                        ),
                        hintText: '9876543210',
                        filled: true,
                        fillColor: isDark ? AppColors.surfaceElevatedDark : AppColors.backgroundLight,
                        border: OutlineInputBorder(
                          borderRadius: AppRadii.borderMd,
                          borderSide: BorderSide(
                            color: isDark ? AppColors.borderDark : AppColors.borderLight,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: AppRadii.borderMd,
                          borderSide: BorderSide(
                            color: isDark ? AppColors.borderDark : AppColors.borderLight,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: AppRadii.borderMd,
                          borderSide: BorderSide(
                            color: AppColors.accentTeal,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    if (errorMessage != null) ...[
                      AppSpacing.vGapSm,
                      Row(
                        children: [
                          const Icon(Icons.error_outline_rounded, size: 16, color: AppColors.error),
                          AppSpacing.hGapXs,
                          Expanded(
                            child: Text(
                              errorMessage!,
                              style: const TextStyle(
                                color: AppColors.error,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    AppSpacing.vGapLg,
                    AppButton.primary(
                      label: 'Send OTP',
                      icon: Icons.arrow_forward_rounded,
                      isLoading: isLoading,
                      isFullWidth: true,
                      onPressed: onSendOtp,
                    ),
                  ],
                ),
              ),

              // 3. Local Dev Quick-Fill Helper
              if (!kReleaseMode && onQuickFill != null) ...[
                AppSpacing.vGapLg,
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.surfaceDark : AppColors.backgroundLight,
                    borderRadius: AppRadii.borderMd,
                    border: Border.all(
                      color: isDark ? AppColors.borderDark : AppColors.borderLight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.bug_report_outlined, size: 16, color: AppColors.accentTeal),
                          AppSpacing.hGapXs,
                          Text(
                            'Dev Quick-Fill (Test Accounts)',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.accentTeal,
                            ),
                          ),
                        ],
                      ),
                      AppSpacing.vGapSm,
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _QuickFillChip(
                            label: 'Resident',
                            phone: '9822011223',
                            onTap: () => onQuickFill!('9822011223'),
                          ),
                          _QuickFillChip(
                            label: 'Guard',
                            phone: '9811223344',
                            onTap: () => onQuickFill!('9811223344'),
                          ),
                          _QuickFillChip(
                            label: 'Chairman',
                            phone: '9922001122',
                            onTap: () => onQuickFill!('9922001122'),
                          ),
                          _QuickFillChip(
                            label: 'Accountant',
                            phone: '9765443322',
                            onTap: () => onQuickFill!('9765443322'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickFillChip extends StatelessWidget {
  final String label;
  final String phone;
  final VoidCallback onTap;

  const _QuickFillChip({
    required this.label,
    required this.phone,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text('$label ($phone)', style: const TextStyle(fontSize: 11)),
      onPressed: onTap,
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
    );
  }
}
