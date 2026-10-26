import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radii.dart';
import '../theme/app_spacing.dart';

enum AppButtonVariant {
  primary,
  secondary,
  outline,
  text,
  destructive,
}

/// Standardized Accessible Button Component (Min 48dp Touch Target)
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;
  final double height;
  final String? tooltip;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.height = 48.0,
    this.tooltip,
  });

  const AppButton.primary({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.height = 48.0,
    this.tooltip,
  }) : variant = AppButtonVariant.primary;

  const AppButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.height = 48.0,
    this.tooltip,
  }) : variant = AppButtonVariant.secondary;

  const AppButton.outline({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.height = 48.0,
    this.tooltip,
  }) : variant = AppButtonVariant.outline;

  const AppButton.text({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.height = 48.0,
    this.tooltip,
  }) : variant = AppButtonVariant.text;

  const AppButton.destructive({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.height = 48.0,
    this.tooltip,
  }) : variant = AppButtonVariant.destructive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Widget childContent;
    if (isLoading) {
      final spinnerColor = variant == AppButtonVariant.outline ||
              variant == AppButtonVariant.text
          ? theme.colorScheme.primary
          : Colors.white;

      childContent = SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2.2,
          valueColor: AlwaysStoppedAnimation<Color>(spinnerColor),
        ),
      );
    } else {
      final textWidget = Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

      if (icon != null) {
        childContent = Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18),
            AppSpacing.hGapSm,
            textWidget,
          ],
        );
      } else {
        childContent = textWidget;
      }
    }

    Widget button;
    final buttonStyle = ElevatedButton.styleFrom(
      minimumSize: Size(isFullWidth ? double.infinity : 64, height),
      shape: RoundedRectangleBorder(borderRadius: AppRadii.borderMd),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
    );

    switch (variant) {
      case AppButtonVariant.primary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: buttonStyle.copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return isDark ? Colors.grey.shade800 : Colors.grey.shade300;
              }
              return isDark ? const Color(0xFF3B82F6) : AppColors.primaryNavy;
            }),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
          ),
          child: childContent,
        );
        break;

      case AppButtonVariant.secondary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: buttonStyle.copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return isDark ? Colors.grey.shade800 : Colors.grey.shade300;
              }
              return AppColors.accentTeal;
            }),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
          ),
          child: childContent,
        );
        break;

      case AppButtonVariant.outline:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(isFullWidth ? double.infinity : 64, height),
            shape: RoundedRectangleBorder(borderRadius: AppRadii.borderMd),
            side: BorderSide(
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
            foregroundColor: isDark ? const Color(0xFF60A5FA) : AppColors.primaryNavy,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          ),
          child: childContent,
        );
        break;

      case AppButtonVariant.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            minimumSize: Size(isFullWidth ? double.infinity : 48, height),
            shape: RoundedRectangleBorder(borderRadius: AppRadii.borderSm),
            foregroundColor: isDark ? const Color(0xFF60A5FA) : AppColors.primaryNavy,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          ),
          child: childContent,
        );
        break;

      case AppButtonVariant.destructive:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: buttonStyle.copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return isDark ? Colors.grey.shade800 : Colors.grey.shade300;
              }
              return AppColors.error;
            }),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
          ),
          child: childContent,
        );
        break;
    }

    if (tooltip != null) {
      return Tooltip(message: tooltip!, child: button);
    }
    return button;
  }
}
