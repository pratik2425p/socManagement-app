import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';
import '../modals/resident_qr_pass_sheet.dart';

/// Quick access banner card for resident dynamic gate pass
class ResidentGatePassCard extends StatelessWidget {
  final SocietyState state;

  const ResidentGatePassCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return PressScale(
      onTap: () => ResidentQrPassSheet.show(context, state),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0F3A66), Color(0xFF1E3A8A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: AppRadii.borderLg,
          boxShadow: AppShadows.subtle(context),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: AppRadii.borderSm,
              ),
              child: const Icon(Icons.qr_code_rounded, color: Colors.white, size: 22),
            ),
            AppSpacing.hGapMd,
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Resident Gate Pass',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Tap to show rotating QR code for gate entry',
                    style: TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.accentTeal,
                borderRadius: AppRadii.borderFull,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.visibility_rounded, size: 14, color: Color(0xFF0F172A)),
                  SizedBox(width: 4),
                  Text(
                    'Show Pass',
                    style: TextStyle(color: Color(0xFF0F172A), fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
