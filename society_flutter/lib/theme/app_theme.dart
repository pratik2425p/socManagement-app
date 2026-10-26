import 'package:flutter/material.dart';
import '../core/core.dart';

/// Legacy AppTheme Adapter - Delegates to Centralized Design System in lib/core
class AppTheme {
  AppTheme._();

  // Brand Colors (Mirrored for backwards-compatibility)
  static const Color primaryNavy = AppColors.primaryNavy;
  static const Color accentTeal = AppColors.accentTeal;
  static const Color darkSlate = AppColors.backgroundDark;
  static const Color lightBackground = AppColors.backgroundLight;
  static const Color surfaceCard = AppColors.surfaceLight;
  static const Color borderLight = AppColors.borderLight;

  // Status Colors
  static const Color successGreen = AppColors.success;
  static const Color warningOrange = AppColors.warning;
  static const Color dangerRed = AppColors.error;
  static const Color infoBlue = AppColors.info;

  // Material 3 Themes
  static ThemeData get lightTheme => AppThemeData.lightTheme;
  static ThemeData get darkTheme => AppThemeData.darkTheme;
}
