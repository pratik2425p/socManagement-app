import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../core/core.dart';
import 'lockout_banner.dart';

/// 6-Digit SMS Passcode Verification Form with Pinput & Countdown
class OtpVerificationView extends StatelessWidget {
  final String phone;
  final TextEditingController pinController;
  final FocusNode focusNode;
  final bool isLoading;
  final int cooldownSeconds;
  final int? attemptsRemaining;
  final bool isLockedOut;
  final String? errorMessage;
  final ValueChanged<String> onVerify;
  final VoidCallback onResend;
  final VoidCallback onChangePhone;

  const OtpVerificationView({
    super.key,
    required this.phone,
    required this.pinController,
    required this.focusNode,
    required this.isLoading,
    required this.cooldownSeconds,
    this.attemptsRemaining,
    required this.isLockedOut,
    this.errorMessage,
    required this.onVerify,
    required this.onResend,
    required this.onChangePhone,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final defaultPinTheme = PinTheme(
      width: 48,
      height: 52,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceElevatedDark : AppColors.backgroundLight,
        borderRadius: AppRadii.borderMd,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.accentTeal, width: 2),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.error, width: 1.5),
      ),
    );

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
              // 1. Header with phone and change button
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
                    Icons.mark_email_unread_outlined,
                    size: 30,
                    color: AppColors.accentTeal,
                  ),
                ),
              ),
              AppSpacing.vGapMd,
              Text(
                'Enter Verification Code',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacing.vGapXs,
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    'Code sent to +91 $phone',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                  InkWell(
                    onTap: onChangePhone,
                    borderRadius: AppRadii.borderSm,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      child: Text(
                        'Edit',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: AppColors.accentTeal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacing.vGapXl,

              // 2. Lockout Warning State
              if (isLockedOut) ...[
                const LockoutBanner(),
                AppSpacing.vGapLg,
              ],

              // 3. Pinput & Verification Card
              AppCard(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!isLockedOut) ...[
                      Center(
                        child: ShakeWidget(
                          shake: errorMessage != null,
                          child: Pinput(
                            length: 6,
                            controller: pinController,
                            focusNode: focusNode,
                            autofocus: true,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            errorPinTheme: errorPinTheme,
                            forceErrorState: errorMessage != null,
                            onCompleted: onVerify,
                          ),
                        ),
                      ),
                      AppSpacing.vGapMd,
                    ],

                    // Attempts Remaining Pill
                    if (attemptsRemaining != null && attemptsRemaining! < 5 && !isLockedOut) ...[
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.warning.withValues(alpha: 0.15),
                            borderRadius: AppRadii.borderFull,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.warning_amber_rounded, size: 14, color: AppColors.warning),
                              AppSpacing.hGapXs,
                              Text(
                                '$attemptsRemaining attempt(s) remaining',
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.warning,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppSpacing.vGapSm,
                    ],

                    // Error Message
                    if (errorMessage != null) ...[
                      Center(
                        child: Text(
                          errorMessage!,
                          style: const TextStyle(
                            color: AppColors.error,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      AppSpacing.vGapMd,
                    ],

                    // Resend Countdown
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 6,
                      children: [
                        Text(
                          "Didn't receive the OTP?",
                          style: theme.textTheme.bodySmall,
                        ),
                        if (cooldownSeconds > 0)
                          Text(
                            'Resend in ${cooldownSeconds}s',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        else
                          InkWell(
                            onTap: isLockedOut ? null : onResend,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                'Resend OTP',
                                style: TextStyle(
                                  color: AppColors.accentTeal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    AppSpacing.vGapLg,

                    // Action Button
                    AppButton.primary(
                      label: isLockedOut ? 'Change Phone Number' : 'Verify & Sign In',
                      icon: isLockedOut ? Icons.arrow_back_rounded : Icons.check_circle_outline_rounded,
                      isLoading: isLoading,
                      isFullWidth: true,
                      onPressed: isLockedOut ? onChangePhone : () => onVerify(pinController.text),
                    ),
                  ],
                ),
              ),

              // Dev Console Hint
              if (!kReleaseMode) ...[
                AppSpacing.vGapLg,
                Center(
                  child: Text(
                    'Dev OTP: 123456 (valid for all accounts)',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.accentTeal,
                    ),
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
