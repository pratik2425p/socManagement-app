import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';
import '../modals/pay_bill_modal.dart';

/// Hero Card for Unpaid Dues or All-Paid Confirmation
class ResidentDuesCard extends StatelessWidget {
  final SocietyState state;
  const ResidentDuesCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final unpaidBills = state.bills.where((b) => b.status == BillStatus.unpaid).toList();

    if (unpaidBills.isEmpty) {
      return AppCard(
        color: AppColors.successContainer,
        borderColor: AppColors.successBorder,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 28),
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
      );
    }

    final bill = unpaidBills.first;
    final total = bill.amount + bill.lateFee;

    return AppCard(
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
              const AppStatusChip.error(label: 'UNPAID'),
            ],
          ),
          AppSpacing.vGapMd,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
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
                ],
              ),
              Text(
                '₹${total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.errorDark,
                ),
              ),
            ],
          ),
          AppSpacing.vGapLg,
          AppButton.destructive(
            label: 'Pay ₹${total.toStringAsFixed(0)} via UPI',
            icon: Icons.flash_on_rounded,
            isFullWidth: true,
            onPressed: () => showPayBillModal(context, bill, state),
          ),
        ],
      ),
    );
  }
}
