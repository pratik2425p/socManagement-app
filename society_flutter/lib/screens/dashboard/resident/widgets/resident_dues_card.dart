import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';
import '../modals/pay_bill_modal.dart';

/// Hero Card for Unpaid Dues or All-Paid Confirmation with ProgressRing
class ResidentDuesCard extends StatelessWidget {
  final SocietyState state;
  const ResidentDuesCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final unpaidBills = state.bills.where((b) => b.status == BillStatus.unpaid).toList();
    final paidBills = state.bills.where((b) => b.status == BillStatus.paid).toList();
    final totalBills = state.bills.length;
    final paidRatio = totalBills > 0 ? (paidBills.length / totalBills) : 1.0;

    if (unpaidBills.isEmpty) {
      return FadeSlideIn(
        child: AppCard(
          color: AppColors.successContainer,
          borderColor: AppColors.successBorder,
          child: Row(
            children: [
              ProgressRing(
                progress: 1.0,
                size: 48,
                strokeWidth: 4.5,
                color: AppColors.success,
                backgroundColor: AppColors.successBorder,
                center: const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 26),
              ),
              AppSpacing.hGapMd,
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'All Maintenance Dues Paid! 🎉',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.successDark),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'No outstanding society invoices for your flat.',
                      style: TextStyle(fontSize: 12, color: AppColors.successDark),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    final bill = unpaidBills.first;
    final total = bill.amount + bill.lateFee;

    return FadeSlideIn(
      child: AppCard(
        color: AppColors.errorContainer,
        borderColor: AppColors.errorBorder,
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
                      decoration: const BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.receipt_long_rounded, color: Colors.white, size: 16),
                    ),
                    AppSpacing.hGapSm,
                    const Text(
                      'MAINTENANCE DUE',
                      style: TextStyle(
                        color: AppColors.errorDark,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const AnimatedStatusChip(
                  label: 'UNPAID',
                  variant: AppStatusVariant.error,
                  icon: Icons.error_outline_rounded,
                ),
              ],
            ),
            AppSpacing.vGapMd,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bill.billingMonth,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Due: ${bill.dueDate.day}/${bill.dueDate.month}/${bill.dueDate.year}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    AppSpacing.vGapXs,
                    Row(
                      children: [
                        ProgressRing(
                          progress: paidRatio,
                          size: 24,
                          strokeWidth: 3.5,
                          color: AppColors.accentTeal,
                          center: Text(
                            '${(paidRatio * 100).toInt()}%',
                            style: const TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                          ),
                        ),
                        AppSpacing.hGapXs,
                        Text(
                          '${paidBills.length}/$totalBills invoices settled',
                          style: const TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                AnimatedCountUp.currency(
                  endValue: total,
                  style: AppTypography.kpiLarge(AppColors.errorDark),
                ),
              ],
            ),
            AppSpacing.vGapLg,
            PressScale(
              child: AppButton.destructive(
                label: 'Pay via Razorpay / UPI',
                icon: Icons.flash_on_rounded,
                isFullWidth: true,
                onPressed: () => showPayBillModal(context, bill, state),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
