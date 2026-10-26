import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Gate bell visitor approval card
class ResidentPendingApprovals extends StatelessWidget {
  final SocietyState state;
  const ResidentPendingApprovals({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final myVisitors = state.visitors.where((v) => v.flatNumber == state.currentFlat).toList();
    final waiting = myVisitors.where((v) => v.status == VisitorStatus.waitingApproval).toList();

    if (waiting.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpacing.vGapLg,
        const AppSectionHeader(
          title: '🔔 Gate Bell (Waiting Your Approval)',
          subtitle: 'Security gate is waiting for your confirmation',
          padding: EdgeInsets.zero,
        ),
        AppSpacing.vGapSm,
        ...waiting.map((v) {
          return AppCard(
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
            color: AppColors.warningContainer,
            borderColor: AppColors.warningBorder,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(v.visitorName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    AppStatusChip.warning(label: v.purpose),
                  ],
                ),
                AppSpacing.vGapXs,
                Text(
                  'Phone: ${v.phoneNumber} • At Gate: ${v.checkInTime != null ? v.checkInTime.toString().substring(11, 16) : "Just now"}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                AppSpacing.vGapMd,
                Row(
                  children: [
                    Expanded(
                      child: AppButton.outline(
                        label: 'Deny Entry',
                        height: 38,
                        onPressed: () {
                          state.updateVisitorStatus(v.id!, VisitorStatus.rejected);
                          AppSnackbar.showWarning(context, 'Entry denied for ${v.visitorName}');
                        },
                      ),
                    ),
                    AppSpacing.hGapMd,
                    Expanded(
                      child: AppButton.secondary(
                        label: 'Approve Entry',
                        icon: Icons.check,
                        height: 38,
                        onPressed: () {
                          state.updateVisitorStatus(v.id!, VisitorStatus.approved);
                          AppSnackbar.showSuccess(context, 'Approved! Guard informed to open gate.');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
