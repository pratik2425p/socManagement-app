import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_motion.dart';
import '../theme/app_radii.dart';
import '../theme/app_spacing.dart';
import 'app_status_chip.dart';

/// Semantic Status Chip with smooth animated state transitions for colors and content.
class AnimatedStatusChip extends StatelessWidget {
  final String label;
  final AppStatusVariant variant;
  final IconData? icon;
  final bool isFilled;
  final EdgeInsetsGeometry padding;

  const AnimatedStatusChip({
    super.key,
    required this.label,
    this.variant = AppStatusVariant.neutral,
    this.icon,
    this.isFilled = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  Color _getForegroundColor(BuildContext context) {
    if (isFilled) return Colors.white;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    switch (variant) {
      case AppStatusVariant.success:
        return isDark ? AppColors.success : AppColors.successDark;
      case AppStatusVariant.warning:
        return isDark ? AppColors.warning : AppColors.warningDark;
      case AppStatusVariant.error:
        return isDark ? AppColors.error : AppColors.errorDark;
      case AppStatusVariant.info:
        return isDark ? AppColors.info : AppColors.infoDark;
      case AppStatusVariant.neutral:
        return isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    }
  }

  Color _getBackgroundColor(BuildContext context, Color fgColor) {
    if (isFilled) return fgColor;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) {
      return fgColor.withValues(alpha: 0.15);
    }
    switch (variant) {
      case AppStatusVariant.success:
        return AppColors.successContainer;
      case AppStatusVariant.warning:
        return AppColors.warningContainer;
      case AppStatusVariant.error:
        return AppColors.errorContainer;
      case AppStatusVariant.info:
        return AppColors.infoContainer;
      case AppStatusVariant.neutral:
        return const Color(0xFFF1F5F9);
    }
  }

  Color _getBorderColor(BuildContext context, Color fgColor) {
    if (isFilled) return Colors.transparent;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) {
      return fgColor.withValues(alpha: 0.35);
    }
    switch (variant) {
      case AppStatusVariant.success:
        return AppColors.successBorder;
      case AppStatusVariant.warning:
        return AppColors.warningBorder;
      case AppStatusVariant.error:
        return AppColors.errorBorder;
      case AppStatusVariant.info:
        return AppColors.infoBorder;
      case AppStatusVariant.neutral:
        return AppColors.borderLight;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fgColor = _getForegroundColor(context);
    final bgColor = _getBackgroundColor(context, fgColor);
    final borderColor = _getBorderColor(context, fgColor);

    return AnimatedContainer(
      duration: context.motionDuration(AppMotion.base),
      curve: AppMotion.standard,
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: AppRadii.borderFull,
        border: Border.all(color: borderColor, width: 1.0),
      ),
      child: AnimatedSwitcher(
        duration: context.motionDuration(AppMotion.fast),
        child: Row(
          key: ValueKey('$label-$variant'),
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 12, color: fgColor),
              AppSpacing.hGapXs,
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: fgColor,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
