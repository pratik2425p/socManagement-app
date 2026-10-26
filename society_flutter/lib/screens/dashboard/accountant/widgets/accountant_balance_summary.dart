import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Financial Position & Balance Cards for Society Accountant (Responsive Web/Mobile)
class AccountantBalanceSummary extends StatelessWidget {
  final SocietyState state;
  const AccountantBalanceSummary({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final paidBills = state.bills.where((b) => b.status == BillStatus.paid).toList();
    final totalCollections = paidBills.fold(0.0, (sum, b) => sum + b.amount);

    final unpaidBills = state.bills.where((b) => b.status == BillStatus.unpaid).toList();
    final totalUnpaid = unpaidBills.fold(0.0, (sum, b) => sum + b.amount);

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
            const AppMetricTile(
              title: 'HDFC Bank Account',
              value: '₹3,42,850',
              subtitle: 'Society Operations A/C',
              icon: Icons.account_balance_rounded,
              accentColor: AppColors.primaryNavy,
            ),
            const AppMetricTile(
              title: 'Cash-in-Hand',
              value: '₹18,400',
              subtitle: 'Petty Cash Ledger',
              icon: Icons.payments_rounded,
              accentColor: AppColors.accentTeal,
            ),
            AppMetricTile(
              title: 'Total Collections',
              value: '₹${totalCollections.toStringAsFixed(0)}',
              subtitle: '${paidBills.length} Invoices Settled',
              icon: Icons.arrow_downward_rounded,
              accentColor: AppColors.success,
            ),
            AppMetricTile(
              title: 'Outstanding Dues',
              value: '₹${totalUnpaid.toStringAsFixed(0)}',
              subtitle: '${unpaidBills.length} Pending Bills',
              icon: Icons.pending_actions_rounded,
              accentColor: totalUnpaid > 0 ? AppColors.error : AppColors.success,
            ),
          ],
        );
      },
    );
  }
}
