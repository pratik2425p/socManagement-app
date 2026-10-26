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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
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
        ),
        AppSpacing.vGapSm,
        AppCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Collections Trend (Past 6 Months)',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '+18.4% vs last Qtr',
                    style: TextStyle(fontSize: 11, color: AppColors.success, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              AppSpacing.vGapSm,
              const SparklineChart(
                data: [125000, 142000, 138000, 165000, 182000, 215000],
                lineColor: AppColors.accentTeal,
                height: 42,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
