import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Chairman Review Queue for Society Expense Vouchers
class ChairmanVoucherQueue extends StatelessWidget {
  final SocietyState state;
  const ChairmanVoucherQueue({super.key, required this.state});

  void _showRejectDialog(BuildContext context, VoucherRequest voucher) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Reject Voucher ${voucher.voucherNumber}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter committee remark / reason for rejection:'),
            AppSpacing.vGapMd,
            AppTextField(
              controller: reasonController,
              label: 'Rejection Reason *',
              hint: 'e.g. Quotation too high, request second vendor quote',
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () {
              final reason = reasonController.text.trim();
              if (reason.isEmpty) return;
              state.rejectVoucher(voucher.id!, reason);
              Navigator.pop(ctx);
              AppSnackbar.showWarning(context, 'Voucher rejected with remarks.');
            },
            child: const Text('Reject Voucher', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pendingVouchers = state.vouchers
        .where((v) => v.status == VoucherStatus.pendingApproval)
        .toList();

    if (pendingVouchers.isEmpty) {
      return const AppCard(
        hasShadow: false,
        padding: AppSpacing.insetAllXl,
        child: Center(
          child: Column(
            children: [
              Icon(Icons.task_alt_rounded, color: AppColors.success, size: 36),
              AppSpacing.vGapSm,
              Text(
                'All Expense Vouchers Reviewed! 🎉',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                'No pending voucher approvals in queue.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: List.generate(pendingVouchers.length, (index) {
        final voucher = pendingVouchers[index];
        return FadeSlideIn.staggered(
          index: index,
          child: Dismissible(
            key: ValueKey('voucher_${voucher.id ?? index}'),
            direction: DismissDirection.horizontal,
            background: Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.success,
                borderRadius: AppRadii.borderMd,
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: const Row(
                children: [
                  Icon(Icons.check_circle_rounded, color: Colors.white, size: 28),
                  AppSpacing.hGapSm,
                  Text(
                    'Approve Expense',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            secondaryBackground: Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: AppRadii.borderMd,
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Reject with Remarks',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  AppSpacing.hGapSm,
                  Icon(Icons.cancel_rounded, color: Colors.white, size: 28),
                ],
              ),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                state.approveVoucher(voucher.id!);
                AppSnackbar.showSuccess(
                  context,
                  'Voucher ${voucher.voucherNumber} approved! Forwarded to Accountant.',
                );
                return true;
              } else {
                _showRejectDialog(context, voucher);
                return false;
              }
            },
            child: AppCard(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              color: AppColors.warningContainer,
              borderColor: AppColors.warningBorder,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          voucher.title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        AppCurrencyFormatter.format(voucher.amount),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primaryNavy),
                      ),
                    ],
                  ),
                  AppSpacing.vGapXs,
                  Text(
                    'Voucher: ${voucher.voucherNumber} • Requested by: ${voucher.requestedByName}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  AppSpacing.vGapSm,
                  Text(
                    voucher.description,
                    style: const TextStyle(fontSize: 12, height: 1.3),
                  ),
                  const Divider(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PressScale(
                        child: AppButton.outline(
                          label: 'Reject with Remarks',
                          height: 36,
                          onPressed: () => _showRejectDialog(context, voucher),
                        ),
                      ),
                      AppSpacing.hGapSm,
                      PressScale(
                        child: AppButton.secondary(
                          label: 'Approve Expense',
                          icon: Icons.check,
                          height: 36,
                          onPressed: () {
                            state.approveVoucher(voucher.id!);
                            AppSnackbar.showSuccess(
                              context,
                              'Voucher ${voucher.voucherNumber} approved! Forwarded to Accountant for Ledger posting.',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
