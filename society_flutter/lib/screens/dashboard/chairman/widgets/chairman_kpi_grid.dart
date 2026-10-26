import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Chairman Executive KPI Metrics Grid
class ChairmanKpiGrid extends StatelessWidget {
  final SocietyState state;
  const ChairmanKpiGrid({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final paidBills = state.bills.where((b) => b.status == BillStatus.paid).toList();
    final totalCollected = paidBills.fold(0.0, (sum, b) => sum + b.amount);

    final openComplaints = state.complaints.where((c) => c.status != ComplaintStatus.resolved).length;
    final pendingVouchers = state.vouchers.where((v) => v.status == VoucherStatus.pendingApproval).length;

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppSpacing.sm,
      crossAxisSpacing: AppSpacing.sm,
      childAspectRatio: 1.5,
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
  }
}
