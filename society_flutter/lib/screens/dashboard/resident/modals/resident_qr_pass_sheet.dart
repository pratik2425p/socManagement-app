import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Dynamic, rotating time-limited gate pass sheet for residents
class ResidentQrPassSheet extends StatefulWidget {
  final SocietyState state;

  const ResidentQrPassSheet({super.key, required this.state});

  static void show(BuildContext context, SocietyState state) {
    AppBottomSheet.show(
      context: context,
      title: 'Digital Resident Gate Pass',
      subtitle: 'Dynamic rotating QR pass for security barrier entry',
      child: ResidentQrPassSheet(state: state),
    );
  }

  @override
  State<ResidentQrPassSheet> createState() => _ResidentQrPassSheetState();
}

class _ResidentQrPassSheetState extends State<ResidentQrPassSheet> {
  Timer? _rotationTimer;
  int _secondsRemaining = QrPassService.passValiditySeconds;
  late String _currentToken;

  @override
  void initState() {
    super.initState();
    _refreshToken();
    _rotationTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_secondsRemaining > 1) {
          _secondsRemaining--;
        } else {
          _refreshToken();
        }
      });
    });
  }

  void _refreshToken() {
    _secondsRemaining = QrPassService.passValiditySeconds;
    final flatNumber = widget.state.currentFlat.isNotEmpty
        ? widget.state.currentFlat
        : 'A-402';
    _currentToken = QrPassService.generateToken(
      societyId: widget.state.currentSocietyId,
      flatNumber: flatNumber,
    );
  }

  @override
  void dispose() {
    _rotationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final flatNumber = widget.state.currentFlat.isNotEmpty
        ? widget.state.currentFlat
        : 'A-402';
    final progress = _secondsRemaining / QrPassService.passValiditySeconds;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Flat & Resident Identity Card
          Container(
            padding: AppSpacing.insetAllMd,
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceElevatedDark : AppColors.primaryNavy,
              borderRadius: AppRadii.borderLg,
              boxShadow: AppShadows.subtle(context),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  child: const Icon(Icons.shield_rounded, color: Colors.white),
                ),
                AppSpacing.hGapMd,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flat $flatNumber • Gate Pass',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      AppSpacing.vGapXs,
                      Text(
                        '${widget.state.currentUserName} • Resident Member',
                        style: const TextStyle(color: Colors.white70, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    borderRadius: AppRadii.borderSm,
                  ),
                  child: const Text(
                    'AUTHENTIC',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.vGapLg,

          // Live Rotating QR Code
          Center(
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: AppRadii.borderXl,
                boxShadow: AppShadows.card(context),
                border: Border.all(color: AppColors.accentTeal.withValues(alpha: 0.4), width: 2),
              ),
              child: QrCodeWidget(
                data: _currentToken,
                size: 210,
                color: const Color(0xFF0F172A),
              ),
            ),
          ),
          AppSpacing.vGapLg,

          // Countdown Timer with ProgressRing
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProgressRing(
                progress: progress,
                size: 32,
                strokeWidth: 3.5,
                color: _secondsRemaining <= 10 ? AppColors.error : AppColors.accentTeal,
                center: Text(
                  '$_secondsRemaining',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: _secondsRemaining <= 10 ? AppColors.error : AppColors.accentTeal,
                  ),
                ),
              ),
              AppSpacing.hGapMd,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rotating OTP Pass (Refreshes in ${_secondsRemaining}s)',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'One-time token prevents unauthorized screenshot sharing',
                    style: TextStyle(
                      fontSize: 10,
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ],
          ),
          AppSpacing.vGapLg,

          // Manual 4-Digit Fallback
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceElevatedDark : const Color(0xFFF1F5F9),
              borderRadius: AppRadii.borderMd,
              border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Manual Entry PIN:',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  'PIN: 4219',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: isDark ? Colors.white : AppColors.primaryNavy,
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.vGapLg,

          AppButton(
            label: 'Close Gate Pass',
            variant: AppButtonVariant.outline,
            isFullWidth: true,
            onPressed: () => Navigator.pop(context),
          ),
          AppSpacing.vGapSm,
        ],
      ),
    );
  }
}
