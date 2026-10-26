import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

/// Static glass-style header container with backdrop blur and border shine.
/// Strictly designed for fixed screen headers or top bars outside of scrollable viewports.
class AppGlassHeader extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;
  final EdgeInsetsGeometry padding;
  final bool showBottomBorder;

  const AppGlassHeader({
    super.key,
    required this.child,
    this.height = 64.0,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
    this.showBottomBorder = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? const Color(0xFF0F172A).withValues(alpha: 0.82)
        : Colors.white.withValues(alpha: 0.85);

    final borderColor = isDark
        ? const Color(0xFF334155).withValues(alpha: 0.6)
        : const Color(0xFFE2E8F0).withValues(alpha: 0.8);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
        child: Container(
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: showBottomBorder
                ? Border(bottom: BorderSide(color: borderColor, width: 1.0))
                : null,
          ),
          child: SafeArea(
            bottom: false,
            child: Align(
              alignment: Alignment.centerLeft,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
