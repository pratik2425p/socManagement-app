import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Pulsing Real-Time Emergency SOS Siren Banner for Guard Terminal
class GuardSosBanner extends StatelessWidget {
  final SocietyState state;
  const GuardSosBanner({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final activeSos = state.activeSosAlerts;
    if (activeSos.isEmpty) return const SizedBox.shrink();

    return Column(
      children: activeSos.map((sos) {
        final isDispatched = sos.status == SosStatus.acknowledged;

        return AppCard(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          color: AppColors.errorContainer,
          borderColor: AppColors.errorBorder,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const PulseDot.sos(size: 12),
                  AppSpacing.hGapSm,
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.emergency_rounded, color: Colors.white, size: 24),
                  ),
                  AppSpacing.hGapMd,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '🚨 EMERGENCY SOS: Flat ${sos.flatNumber}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.errorDark,
                          ),
                        ),
                        Text(
                          'Type: ${sos.emergencyType.name.toUpperCase()} • Raised by ${sos.raisedByName}',
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  AppStatusChip(
                    label: sos.status.name,
                    variant: isDispatched ? AppStatusVariant.warning : AppStatusVariant.error,
                    isFilled: true,
                  ),
                ],
              ),
              if (sos.description != null && sos.description!.isNotEmpty) ...[
                AppSpacing.vGapSm,
                Text(
                  'Note: "${sos.description!}"',
                  style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ],
              AppSpacing.vGapMd,
              Row(
                children: [
                  if (!isDispatched)
                    Expanded(
                      child: AppButton.destructive(
                        label: 'Acknowledge & Dispatch Guard',
                        icon: Icons.directions_run_rounded,
                        onPressed: () {
                          state.acknowledgeSos(sos.id!, state.currentUserName);
                          AppSnackbar.showWarning(context, '🚨 Guard dispatched to Flat ${sos.flatNumber}!');
                        },
                      ),
                    )
                  else
                    Expanded(
                      child: AppButton.secondary(
                        label: 'Mark Emergency Resolved',
                        icon: Icons.check_circle_rounded,
                        onPressed: () {
                          state.resolveSos(sos.id!, state.currentUserName, 'Situation resolved and secured.');
                          AppSnackbar.showSuccess(context, 'Emergency Cleared & Resolved.');
                        },
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
