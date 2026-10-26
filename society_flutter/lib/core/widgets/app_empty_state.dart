import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_motion.dart';
import '../theme/app_spacing.dart';
import 'app_button.dart';

/// Animated Empty State View with subtle floating icon and optional CTA.
class AppEmptyState extends StatefulWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final double iconSize;

  const AppEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
    this.iconSize = 52.0,
  });

  @override
  State<AppEmptyState> createState() => _AppEmptyStateState();
}

class _AppEmptyStateState extends State<AppEmptyState> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final motionOn = context.motionEnabled;

    Widget iconWidget = Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceElevatedDark : const Color(0xFFF1F5F9),
        shape: BoxShape.circle,
        border: Border.all(
          color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
          width: 1.5,
        ),
      ),
      child: Icon(
        widget.icon,
        size: widget.iconSize,
        color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
      ),
    );

    if (motionOn) {
      iconWidget = AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final dy = math.sin(_controller.value * math.pi) * 6.0;
          return Transform.translate(
            offset: Offset(0, dy),
            child: child,
          );
        },
        child: iconWidget,
      );
    }

    return Center(
      child: Padding(
        padding: AppSpacing.insetAllXxl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget,
            AppSpacing.vGapLg,
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacing.vGapXs,
            Text(
              widget.message,
              style: TextStyle(
                fontSize: 13,
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            if (widget.actionLabel != null && widget.onAction != null) ...[
              AppSpacing.vGapLg,
              AppButton.primary(
                label: widget.actionLabel!,
                onPressed: widget.onAction!,
                height: 42,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
