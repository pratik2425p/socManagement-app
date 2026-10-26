import 'package:flutter/material.dart';

/// Semantic Design System Color Tokens for Society Management SaaS
class AppColors {
  AppColors._();

  // --- Brand Colors ---
  static const Color primaryNavy = Color(0xFF0F3A66);
  static const Color primaryDark = Color(0xFF0A2544);
  static const Color primaryLight = Color(0xFF1E5B99);
  static const Color primaryContainer = Color(0xFFE0F2FE);

  // --- Secondary Accents ---
  static const Color accentTeal = Color(0xFF0D9488);
  static const Color accentTealDark = Color(0xFF0F766E);
  static const Color accentTealLight = Color(0xFF14B8A6);
  static const Color secondaryContainer = Color(0xFFCCFBF1);

  // --- Neutrals & Surfaces (Light) ---
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Colors.white;
  static const Color surfaceElevatedLight = Colors.white;
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderSubtleLight = Color(0xFFF1F5F9);

  // --- Neutrals & Surfaces (Dark) ---
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color surfaceElevatedDark = Color(0xFF334155);
  static const Color borderDark = Color(0xFF334155);
  static const Color borderSubtleDark = Color(0xFF1E293B);

  // --- Text Colors (Light) ---
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF475569);
  static const Color textMutedLight = Color(0xFF94A3B8);

  // --- Text Colors (Dark) ---
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFFCBD5E1);
  static const Color textMutedDark = Color(0xFF64748B);

  // --- Semantic Status: Success ---
  static const Color success = Color(0xFF10B981);
  static const Color successContainer = Color(0xFFECFDF5);
  static const Color successBorder = Color(0xFFA7F3D0);
  static const Color successDark = Color(0xFF059669);

  // --- Semantic Status: Warning ---
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningContainer = Color(0xFFFFFBEB);
  static const Color warningBorder = Color(0xFFFDE68A);
  static const Color warningDark = Color(0xFFD97706);

  // --- Semantic Status: Danger / Error ---
  static const Color error = Color(0xFFEF4444);
  static const Color errorContainer = Color(0xFFFEF2F2);
  static const Color errorBorder = Color(0xFFFECACA);
  static const Color errorDark = Color(0xFFDC2626);

  // --- Semantic Status: Info / Secret Ballot ---
  static const Color info = Color(0xFF3B82F6);
  static const Color infoContainer = Color(0xFFEFF6FF);
  static const Color infoBorder = Color(0xFFBFDBFE);
  static const Color infoDark = Color(0xFF2563EB);

  // --- Role Accent Tags ---
  static const Color roleResident = primaryNavy;
  static const Color roleGuard = Color(0xFFD97706);
  static const Color roleChairman = Color(0xFF7C3AED);
  static const Color roleCommittee = Color(0xFF0284C7);
  static const Color roleAccountant = accentTeal;
  static const Color roleAdmin = Color(0xFF4338CA);

  // Helpers for dark/light context
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color surface(BuildContext context) =>
      isDark(context) ? surfaceDark : surfaceLight;

  static Color background(BuildContext context) =>
      isDark(context) ? backgroundDark : backgroundLight;

  static Color border(BuildContext context) =>
      isDark(context) ? borderDark : borderLight;

  static Color textPrimary(BuildContext context) =>
      isDark(context) ? textPrimaryDark : textPrimaryLight;

  static Color textSecondary(BuildContext context) =>
      isDark(context) ? textSecondaryDark : textSecondaryLight;

  static Color textMuted(BuildContext context) =>
      isDark(context) ? textMutedDark : textMutedLight;
}
