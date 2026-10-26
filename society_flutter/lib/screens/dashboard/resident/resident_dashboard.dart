import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/data/demo_data_source.dart';
import '../../../../services/society_state.dart';
import 'modals/digital_gate_pass_modal.dart';
import 'modals/emergency_sos_modal.dart';
import 'modals/pre_approve_visitor_modal.dart';
import 'modals/raise_complaint_modal.dart';
import 'widgets/resident_dues_card.dart';
import 'widgets/resident_gate_pass_card.dart';
import 'widgets/resident_greeting_card.dart';
import 'widgets/resident_pending_approvals.dart';
import 'widgets/resident_quick_actions.dart';

/// Redesigned Modular Resident Dashboard (<260 lines)
class ResidentDashboard extends StatelessWidget {
  final SocietyState state;
  const ResidentDashboard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final myVisitors = state.visitors.where((v) => v.flatNumber == state.currentFlat).toList();
    final myComplaints = state.complaints.where((c) => c.flatNumber == state.currentFlat).toList();
    final activeSos = state.activeSosAlerts;

    return RefreshIndicator(
      onRefresh: () => state.fetchInitialData(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: AppSpacing.screenPadding,
        child: ResponsiveContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // 1. Greeting & Flat Banner
            ResidentGreetingCard(state: state),
            AppSpacing.vGapMd,

            // Demo Mode Gate Bell Simulator Quick Action
            if (AppConfig.isDemoMode && state.dataSource is DemoDataSource) ...[
              PressScale(
                onTap: () {
                  (state.dataSource as DemoDataSource).simulateVisitorArrival();
                  AppSnackbar.showInfo(context, '🔔 Simulated visitor arrival! Ringing Flat A-101 Gate Bell...');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  margin: const EdgeInsets.only(bottom: AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.accentTeal.withValues(alpha: 0.12),
                    borderRadius: AppRadii.borderMd,
                    border: Border.all(color: AppColors.accentTeal.withValues(alpha: 0.3)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.doorbell_rounded, color: AppColors.accentTeal, size: 20),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Simulate Gate Bell Ringing (Demo Test)',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.accentTealDark),
                        ),
                      ),
                      Icon(Icons.play_circle_fill_rounded, color: AppColors.accentTeal, size: 18),
                    ],
                  ),
                ),
              ),
            ],

            // 2. Active SOS Siren Banner (if triggered)
            if (activeSos.isNotEmpty) ...[
              AppCard(
                color: AppColors.errorContainer,
                borderColor: AppColors.errorBorder,
                child: Row(
                  children: [
                    const PulseDot.sos(size: 10),
                    AppSpacing.hGapSm,
                    const Icon(Icons.emergency_rounded, color: AppColors.error, size: 28),
                    AppSpacing.hGapMd,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EMERGENCY SOS ACTIVE: Flat ${activeSos.first.flatNumber}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.errorDark),
                          ),
                          Text(
                            'Category: ${activeSos.first.emergencyType.name.toUpperCase()} • Security dispatched',
                            style: const TextStyle(fontSize: 11, color: AppColors.errorDark),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.vGapMd,
            ],

            // 3. Pending Gate Bell Approvals
            ResidentPendingApprovals(state: state),

            // 4. Maintenance Dues Hero Card
            AppSpacing.vGapLg,
            ResidentDuesCard(state: state),
            AppSpacing.vGapMd,

            // 4b. Dynamic Gate Pass (QR)
            ResidentGatePassCard(state: state),
            AppSpacing.vGapXl,

            // 5. Quick Actions 2x3 Grid
            ResidentQuickActions(state: state),
            AppSpacing.vGapXl,

            // 6. Recent Visitors
            AppSectionHeader(
              title: 'Recent Visitors (${myVisitors.length})',
              actionLabel: '+ Pre-Approve',
              onAction: () => showPreApproveVisitorModal(context, state),
            ),
            AppSpacing.vGapSm,
            if (myVisitors.isEmpty)
              const AppEmptyState(
                icon: Icons.person_off_outlined,
                title: 'No Visitors Yet',
                message: 'Generate a 4-digit PIN gatepass for friends, delivery, or cabs.',
              )
            else
              ...myVisitors.take(4).map((v) {
                return AppCard(
                  onTap: () => showDigitalGatePassModal(context, v),
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: AppColors.primaryNavy.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person_pin_rounded, color: AppColors.primaryNavy, size: 20),
                      ),
                      AppSpacing.hGapMd,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(v.visitorName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            const SizedBox(height: 2),
                            Text(
                              'Passcode: ${v.passcode ?? "N/A"} • ${v.purpose}',
                              style: const TextStyle(fontSize: 11, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      AppStatusChip(
                        label: v.status.name,
                        variant: v.status == VisitorStatus.inside
                            ? AppStatusVariant.success
                            : (v.status == VisitorStatus.waitingApproval
                                ? AppStatusVariant.warning
                                : AppStatusVariant.neutral),
                      ),
                    ],
                  ),
                );
              }),
            AppSpacing.vGapXl,

            // 7. Society Circulars & Notices
            const AppSectionHeader(title: 'Society Circulars & Notices'),
            AppSpacing.vGapSm,
            if (state.notices.isEmpty)
              const AppEmptyState(
                icon: Icons.notifications_none_rounded,
                title: 'No Circulars',
                message: 'No official announcements broadcasted by the committee.',
              )
            else
              ...state.notices.take(3).map((notice) {
                final isUrgent = notice.priority.toLowerCase() == 'urgent';
                return AppCard(
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  borderColor: isUrgent ? AppColors.warningBorder : null,
                  color: isUrgent ? AppColors.warningContainer : null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              notice.title,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (isUrgent)
                            const AppStatusChip.warning(label: 'URGENT')
                          else
                            const AppStatusChip.info(label: 'CIRCULAR'),
                        ],
                      ),
                      AppSpacing.vGapXs,
                      Text(
                        notice.content,
                        style: const TextStyle(fontSize: 12, height: 1.4),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'By: ${notice.postedByName} • ${notice.postedAt.day}/${notice.postedAt.month}/${notice.postedAt.year}',
                        style: const TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }),
            AppSpacing.vGapXl,

            // 8. My Raised Complaints
            AppSectionHeader(
              title: 'My Complaints (${myComplaints.length})',
              actionLabel: 'Raise Ticket',
              onAction: () => showRaiseComplaintModal(context, state),
            ),
            AppSpacing.vGapSm,
            if (myComplaints.isEmpty)
              const AppEmptyState(
                icon: Icons.support_agent_rounded,
                title: 'No Active Complaints',
                message: 'Have an issue? Tap Raise Ticket to notify society staff.',
              )
            else
              ...myComplaints.take(3).map((c) {
                return AppCard(
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(c.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            const SizedBox(height: 2),
                            Text('Category: ${c.category}', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                      ),
                      AppStatusChip(
                        label: c.status.name,
                        variant: c.status == ComplaintStatus.resolved
                            ? AppStatusVariant.success
                            : AppStatusVariant.warning,
                      ),
                    ],
                  ),
                );
              }),
            AppSpacing.vGapXl,

            // 9. Emergency SOS Trigger Button
            AppButton.destructive(
              label: 'TRIGGER EMERGENCY SOS ALARM',
              icon: Icons.emergency_rounded,
              isFullWidth: true,
              onPressed: () => showEmergencySosModal(context, state),
            ),
            AppSpacing.vGapXxl,
          ],
        ),
      ),
    ),
  );
  }
}
