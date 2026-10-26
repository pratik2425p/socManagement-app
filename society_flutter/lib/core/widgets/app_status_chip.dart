import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radii.dart';
import '../theme/app_spacing.dart';

enum AppStatusVariant {
  success,
  warning,
  error,
  info,
  neutral,
}

/// Standardized Semantic Status Badge
class AppStatusChip extends StatelessWidget {
  final String label;
  final AppStatusVariant variant;
  final IconData? icon;
  final bool isFilled;
  final EdgeInsetsGeometry padding;

  const AppStatusChip({
    super.key,
    required this.label,
    this.variant = AppStatusVariant.neutral,
    this.icon,
    this.isFilled = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  const AppStatusChip.success({
    super.key,
    required this.label,
    this.icon = Icons.check_circle_outline,
    this.isFilled = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  }) : variant = AppStatusVariant.success;

  const AppStatusChip.warning({
    super.key,
    required this.label,
    this.icon = Icons.access_time,
    this.isFilled = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  }) : variant = AppStatusVariant.warning;

  const AppStatusChip.error({
    super.key,
    required this.label,
    this.icon = Icons.error_outline,
    this.isFilled = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  }) : variant = AppStatusVariant.error;

  const AppStatusChip.info({
    super.key,
    required this.label,
    this.icon = Icons.info_outline,
    this.isFilled = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  }) : variant = AppStatusVariant.info;

  const AppStatusChip.neutral({
    super.key,
    required this.label,
    this.icon,
    this.isFilled = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  }) : variant = AppStatusVariant.neutral;

  @override
  Widget build(BuildContext context) {
    Color fgColor;
    Color bgColor;
    Color borderColor;

    switch (variant) {
      case AppStatusVariant.success:
        fgColor = AppColors.successDark;
        bgColor = AppColors.successContainer;
        borderColor = AppColors.successBorder;
        break;
      case AppStatusVariant.warning:
        fgColor = AppColors.warningDark;
        bgColor = AppColors.warningContainer;
        borderColor = AppColors.warningBorder;
        break;
      case AppStatusVariant.error:
        fgColor = AppColors.errorDark;
        bgColor = AppColors.errorContainer;
        borderColor = AppColors.errorBorder;
        break;
      case AppStatusVariant.info:
        fgColor = AppColors.infoDark;
        bgColor = AppColors.infoContainer;
        borderColor = AppColors.infoBorder;
        break;
      case AppStatusVariant.neutral:
        fgColor = AppColors.textSecondaryLight;
        bgColor = const Color(0xFFF1F5F9);
        borderColor = AppColors.borderLight;
        break;
    }

    if (isFilled) {
      return Container(
        padding: padding,
        decoration: BoxDecoration(
          color: fgColor,
          borderRadius: AppRadii.borderSm,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 12, color: Colors.white),
              AppSpacing.hGapXs,
            ],
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: AppRadii.borderSm,
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: fgColor),
            AppSpacing.hGapXs,
          ],
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: fgColor,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
