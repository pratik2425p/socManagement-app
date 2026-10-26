import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Chairman Executive KPI Metrics Grid with Responsive Desktop & Mobile Layout
class ChairmanKpiGrid extends StatelessWidget {
  final SocietyState state;
  const ChairmanKpiGrid({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final paidBills = state.bills.where((b) => b.status == BillStatus.paid).toList();
    final totalCollected = paidBills.fold(0.0, (sum, b) => sum + b.amount);

    final openComplaints = state.complaints.where((c) => c.status != ComplaintStatus.resolved).length;
    final pendingVouchers = state.vouchers.where((v) => v.status == VoucherStatus.pendingApproval).length;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 840;
        final isTablet = constraints.maxWidth >= 540 && constraints.maxWidth < 840;

        final crossAxisCount = isDesktop ? 4 : 2;
        final childAspectRatio = isDesktop ? 2.2 : (isTablet ? 2.0 : 1.45);

        return GridView.count(
          crossAxisCount: crossAxisCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: AppSpacing.sm,
          crossAxisSpacing: AppSpacing.sm,
          childAspectRatio: childAspectRatio,
          children: [
            AppMetricTile(
              title: 'Total Collections',
              value: '₹${totalCollected.toStringAsFixed(0)}',
              subtitle: '${paidBills.length} bills settled',
              icon: Icons.account_balance_wallet_rounded,
              accentColor: AppColors.success,
            ),
            AppMetricTile(
              title: 'Society Flats',
              value: '${state.flats.isNotEmpty ? state.flats.length : (state.currentSociety?.totalFlats ?? 35)}',
              subtitle: 'Active Registered Units',
              icon: Icons.apartment_rounded,
              accentColor: AppColors.primaryNavy,
            ),
            AppMetricTile(
              title: 'Open Complaints',
              value: '$openComplaints',
              subtitle: 'Requiring Attention',
              icon: Icons.support_agent_rounded,
              accentColor: openComplaints > 0 ? AppColors.warning : AppColors.success,
            ),
            AppMetricTile(
              title: 'Pending Vouchers',
              value: '$pendingVouchers',
              subtitle: 'Awaiting Your Approval',
              icon: Icons.rule_folder_rounded,
              accentColor: pendingVouchers > 0 ? AppColors.error : AppColors.success,
            ),
          ],
        );
      },
    );
  }
}
