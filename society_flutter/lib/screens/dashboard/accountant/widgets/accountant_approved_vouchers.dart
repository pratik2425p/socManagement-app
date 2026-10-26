import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Chairman-Approved Expense Vouchers Ready for Ledger Execution
class AccountantApprovedVouchers extends StatelessWidget {
  final SocietyState state;
  const AccountantApprovedVouchers({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final readyVouchers = state.vouchers
        .where((v) => v.status == VoucherStatus.approved)
        .toList();

    if (readyVouchers.isEmpty) {
      return const AppCard(
        hasShadow: false,
        padding: AppSpacing.insetAllXl,
        child: Center(
          child: Column(
            children: [
              Icon(Icons.check_circle_outline_rounded, color: AppColors.success, size: 36),
              AppSpacing.vGapSm,
              Text(
                'All Approved Vouchers Posted! 🎉',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                'No vouchers currently pending ledger execution.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: readyVouchers.map((v) {
        return AppCard(
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          color: AppColors.primaryContainer.withValues(alpha: 0.5),
          borderColor: AppColors.primaryNavy.withValues(alpha: 0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      v.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '₹${v.amount.toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primaryNavy),
                  ),
                ],
              ),
              AppSpacing.vGapXs,
              Text(
                'Voucher: ${v.voucherNumber} • Chairman Approved: ${v.approvedByName ?? "Chairman"}',
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
              AppSpacing.vGapSm,
              Text(
                v.description,
                style: const TextStyle(fontSize: 12, height: 1.3),
              ),
              const Divider(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppStatusChip.success(label: 'CHAIRMAN APPROVED'),
                  AppButton.secondary(
                    label: 'Post to Double-Entry Ledger',
                    icon: Icons.account_balance_wallet_rounded,
                    height: 38,
                    onPressed: () {
                      state.postVoucherToLedger(v.id!);
                      AppSnackbar.showSuccess(
                        context,
                        'Posted voucher ${v.voucherNumber} into General Ledger as balancing JE!',
                      );
                    },
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
