import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';
import 'widgets/accountant_approved_vouchers.dart';
import 'widgets/accountant_balance_summary.dart';
import 'widgets/accountant_general_ledger_view.dart';

/// Redesigned Accountant & Ledger Dashboard (<180 lines)
class AccountantDashboard extends StatelessWidget {
  final SocietyState state;
  const AccountantDashboard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => state.fetchInitialData(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: AppSpacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Balance & Cash Snapshot
            const AppSectionHeader(
              title: 'Society Financial Snapshot',
              subtitle: 'Bank accounts, petty cash & billing reconciliation',
              padding: EdgeInsets.zero,
            ),
            AppSpacing.vGapSm,
            AccountantBalanceSummary(state: state),
            AppSpacing.vGapXl,

            // 2. Chairman-Approved Vouchers Ready to Post
            const AppSectionHeader(
              title: 'Approved Vouchers (Awaiting Ledger Posting)',
              subtitle: 'Requires Accountant authorization to generate balancing Journal Entries',
            ),
            AppSpacing.vGapSm,
            AccountantApprovedVouchers(state: state),
            AppSpacing.vGapXl,

            // 3. Real-Time General Ledger
            const AppSectionHeader(
              title: 'Double-Entry General Ledger (JE-xxx)',
              subtitle: 'Immutable statutory journal entries and audit records',
            ),
            AppSpacing.vGapSm,
            AccountantGeneralLedgerView(state: state),
            AppSpacing.vGapXxl,
          ],
        ),
      ),
    );
  }
}
