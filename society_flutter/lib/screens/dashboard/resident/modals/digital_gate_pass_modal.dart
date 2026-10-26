import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';

void showDigitalGatePassModal(BuildContext context, VisitorEntry entry) {
  AppBottomSheet.show(
    context: context,
    title: '🛡️ Digital Gate Pass',
    subtitle: 'Share this passcode with your guest or delivery agent',
    child: DigitalGatePassContent(entry: entry),
  );
}

class DigitalGatePassContent extends StatelessWidget {
  final VisitorEntry entry;
  const DigitalGatePassContent({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pin = entry.passcode ?? '----';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Digital Pass Card
        Container(
          padding: AppSpacing.insetAllXl,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0F3A66), Color(0xFF1E3A8A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: AppRadii.borderXl,
            boxShadow: AppShadows.elevated(context),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'RESIDENT GATE PASS',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.success,
                      borderRadius: AppRadii.borderSm,
                    ),
                    child: const Text(
                      'PRE-APPROVED',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacing.vGapLg,

              // 4-Digit Passcode Display
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: AppRadii.borderLg,
                ),
                child: Column(
                  children: [
                    const Text(
                      'SHOW AT SECURITY GATE',
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    AppSpacing.vGapXs,
                    Text(
                      pin,
                      style: const TextStyle(
                        color: AppColors.primaryNavy,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 8,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.vGapLg,

              // Details Grid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('VISITOR', style: TextStyle(color: Colors.white60, fontSize: 10)),
                      Text(
                        entry.visitorName,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('DESTINATION', style: TextStyle(color: Colors.white60, fontSize: 10)),
                      Text(
                        'Flat ${entry.flatNumber}',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        AppSpacing.vGapLg,

        // Instructions
        Container(
          padding: AppSpacing.insetAllMd,
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceElevatedDark : const Color(0xFFF1F5F9),
            borderRadius: AppRadii.borderMd,
          ),
          child: Row(
            children: [
              const Icon(Icons.info_outline, size: 20, color: AppColors.accentTeal),
              AppSpacing.hGapMd,
              Expanded(
                child: Text(
                  'The guard will enter this 4-digit code into their terminal to grant automatic boom-barrier entry.',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ),
            ],
          ),
        ),
        AppSpacing.vGapXl,

        // Actions
        Row(
          children: [
            Expanded(
              child: AppButton.outline(
                label: 'Copy Passcode',
                icon: Icons.copy_rounded,
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: pin));
                  AppSnackbar.showSuccess(context, 'Passcode $pin copied to clipboard!');
                },
              ),
            ),
            AppSpacing.hGapMd,
            Expanded(
              child: AppButton.primary(
                label: 'Done',
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
