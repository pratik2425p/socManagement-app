import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';

void showPaymentReceiptModal(BuildContext context, PaymentRecord record, MaintenanceBill bill) {
  AppBottomSheet.show(
    context: context,
    title: '🧾 Maintenance Payment Receipt',
    subtitle: 'Auto-reconciled with Double-Entry General Ledger',
    child: _ReceiptContent(record: record, bill: bill),
  );
}

class _ReceiptContent extends StatelessWidget {
  final PaymentRecord record;
  final MaintenanceBill bill;
  const _ReceiptContent({required this.record, required this.bill});

  Widget _buildRow(BuildContext context, String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context))),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: AppColors.textPrimary(context),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Success Header
        Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: const BoxDecoration(
                  color: AppColors.successContainer,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_rounded, color: AppColors.successDark, size: 36),
              ),
              AppSpacing.vGapSm,
              const Text(
                'Payment Successful!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              AppSpacing.vGapXs,
              Text(
                '₹${record.amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.successDark,
                ),
              ),
            ],
          ),
        ),
        AppSpacing.vGapLg,

        // Receipt Card
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRow(context, 'Transaction ID', record.transactionReference, isBold: true),
              _buildRow(context, 'Receipt Number', record.receiptNumber),
              _buildRow(context, 'Bill Number', bill.billNumber),
              _buildRow(context, 'Billing Month', bill.billingMonth),
              _buildRow(context, 'Flat Number', bill.flatNumber),
              _buildRow(context, 'Payment Mode', record.paymentMethod),
              _buildRow(context, 'Date & Time', record.paymentDate.toString().substring(0, 19)),
              const Divider(height: 20),
              _buildRow(context, 'Status', 'CLEARED & POSTED', isBold: true),
            ],
          ),
        ),
        AppSpacing.vGapLg,

        AppButton.primary(
          label: 'Close Receipt',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
