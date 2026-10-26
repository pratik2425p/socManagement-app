import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Standardized User / Society Avatar with Fallback Initials
class AppAvatar extends StatelessWidget {
  final String? name;
  final double radius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool hasBorder;

  const AppAvatar({
    super.key,
    this.name,
    this.radius = 18.0,
    this.backgroundColor,
    this.foregroundColor,
    this.hasBorder = false,
  });

  String get _initials {
    if (name == null || name!.trim().isEmpty) return 'U';
    final parts = name!.trim().split(RegExp(r'\s+'));
    if (parts.length > 1 && parts[1].isNotEmpty) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? AppColors.accentTeal;
    final fg = foregroundColor ?? Colors.white;

    Widget avatar = CircleAvatar(
      radius: radius,
      backgroundColor: bg,
      child: Text(
        _initials,
        style: TextStyle(
          color: fg,
          fontSize: radius * 0.75,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    if (hasBorder) {
      return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.6),
            width: 1.5,
          ),
        ),
        child: avatar,
      );
    }

    return avatar;
  }
}
