import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Real-Time General Ledger Table / Entry Cards
class AccountantGeneralLedgerView extends StatelessWidget {
  final SocietyState state;
  const AccountantGeneralLedgerView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final entries = state.ledgerEntries;

    if (entries.isEmpty) {
      return const AppEmptyState(
        icon: Icons.account_balance_outlined,
        title: 'General Ledger is Empty',
        message: 'Post approved vouchers or record maintenance dues to generate journal entries.',
      );
    }

    return Column(
      children: List.generate(entries.length, (index) {
        final e = entries[index];
        final isBalanced = (e.totalDebit - e.totalCredit).abs() < 0.01;

        return FadeSlideIn.staggered(
          index: index,
          child: AppCard(
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.xs),
                          decoration: BoxDecoration(
                            color: AppColors.accentTeal.withValues(alpha: 0.15),
                            borderRadius: AppRadii.borderSm,
                          ),
                          child: const Icon(Icons.receipt_rounded, size: 16, color: AppColors.accentTeal),
                        ),
                        AppSpacing.hGapSm,
                        Text(
                          e.entryNumber,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.primaryNavy),
                        ),
                      ],
                    ),
                    AppStatusChip(
                      label: isBalanced ? 'BALANCED' : 'UNBALANCED',
                      variant: isBalanced ? AppStatusVariant.success : AppStatusVariant.error,
                    ),
                  ],
                ),
                AppSpacing.vGapSm,
                Text(
                  e.description,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                const SizedBox(height: 2),
                Text(
                  'Posted by: ${e.postedByName} • ${AppDateTimeFormatter.formatDate(e.entryDate)}',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const Divider(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('TOTAL DEBIT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                        Text(
                          AppCurrencyFormatter.format(e.totalDebit),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.errorDark),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('TOTAL CREDIT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                        Text(
                          AppCurrencyFormatter.format(e.totalCredit),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.successDark),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
