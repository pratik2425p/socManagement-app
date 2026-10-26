import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Standardized SaaS Gradient Tokens for modern hero banners and surface highlights.
class AppGradients {
  AppGradients._();

  /// Primary Navy Header Gradient (Hero banners, sign-in headers, app bars)
  static const LinearGradient navyHero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0F3A66),
      Color(0xFF0A2544),
    ],
  );

  /// Emerald / Teal SaaS Accent Gradient (Paid states, approved cards)
  static const LinearGradient tealAccent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0D9488),
      Color(0xFF0F766E),
    ],
  );

  /// Danger / SOS Pulsing Emergency Gradient
  static const LinearGradient emergencyHero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFEF4444),
      Color(0xFFB91C1C),
    ],
  );

  /// Subtle KPI Card Gradient (adaptive to light/dark mode)
  static LinearGradient kpiCard(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) {
      return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF1E293B),
          Color(0xFF172033),
        ],
      );
    }
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white,
        Color(0xFFF8FAFC),
      ],
    );
  }

  /// Glass border highlight gradient for cards and modals
  static LinearGradient glassBorder(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) {
      return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withValues(alpha: 0.15),
          Colors.white.withValues(alpha: 0.03),
        ],
      );
    }
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white.withValues(alpha: 0.8),
        AppColors.borderLight,
      ],
    );
  }
}
