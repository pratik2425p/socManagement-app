import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Single Visitor Card with Guard Action Buttons
class GuardVisitorCard extends StatelessWidget {
  final VisitorEntry entry;
  final SocietyState state;

  const GuardVisitorCard({
    super.key,
    required this.entry,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final status = entry.status;
    final timeStr = entry.checkInTime != null
        ? '${entry.checkInTime!.hour.toString().padLeft(2, '0')}:${entry.checkInTime!.minute.toString().padLeft(2, '0')}'
        : 'Pending';

    return AppCard(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppAvatar(
                    name: entry.visitorName,
                    radius: 18,
                    backgroundColor: status == VisitorStatus.inside
                        ? AppColors.success
                        : AppColors.primaryNavy,
                  ),
                  AppSpacing.hGapMd,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.visitorName,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        'Flat ${entry.flatNumber} • ${entry.purpose}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              AppStatusChip(
                label: status.name,
                variant: status == VisitorStatus.inside
                    ? AppStatusVariant.success
                    : (status == VisitorStatus.waitingApproval
                        ? AppStatusVariant.warning
                        : AppStatusVariant.neutral),
              ),
            ],
          ),
          AppSpacing.vGapSm,
          Row(
            children: [
              Text('Phone: ${entry.phoneNumber}', style: const TextStyle(fontSize: 11, color: Colors.grey)),
              if (entry.vehicleNumber != null && entry.vehicleNumber!.isNotEmpty) ...[
                const Text(' • ', style: TextStyle(color: Colors.grey)),
                Text('Vehicle: ${entry.vehicleNumber!}', style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
              const Spacer(),
              Text('In: $timeStr', style: const TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
          const Divider(height: 16),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (status == VisitorStatus.inside)
                AppButton.outline(
                  label: 'Mark Exited',
                  icon: Icons.logout_rounded,
                  height: 36,
                  onPressed: () {
                    state.updateVisitorStatus(entry.id!, VisitorStatus.exited);
                    AppSnackbar.showInfo(context, '${entry.visitorName} marked as EXITED campus.');
                  },
                ),
              if (status == VisitorStatus.waitingApproval) ...[
                AppButton.outline(
                  label: 'Reject',
                  height: 36,
                  onPressed: () {
                    state.updateVisitorStatus(entry.id!, VisitorStatus.rejected);
                    AppSnackbar.showWarning(context, 'Entry rejected.');
                  },
                ),
                AppSpacing.hGapSm,
                AppButton.secondary(
                  label: 'Allow In',
                  icon: Icons.check,
                  height: 36,
                  onPressed: () {
                    state.updateVisitorStatus(entry.id!, VisitorStatus.inside);
                    AppSnackbar.showSuccess(context, 'Gate opened for ${entry.visitorName}.');
                  },
                ),
              ],
              if (status == VisitorStatus.expected)
                AppButton.secondary(
                  label: 'Check-In Visitor',
                  icon: Icons.login_rounded,
                  height: 36,
                  onPressed: () {
                    state.updateVisitorStatus(entry.id!, VisitorStatus.inside);
                    AppSnackbar.showSuccess(context, 'Checked in ${entry.visitorName} to campus.');
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
