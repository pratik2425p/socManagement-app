import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';
import 'payment_receipt_modal.dart';

void showPayBillModal(BuildContext context, MaintenanceBill bill, SocietyState state) {
  AppBottomSheet.show(
    context: context,
    title: 'Pay Maintenance Bill',
    subtitle: '${bill.billingMonth} • ${bill.billNumber}',
    child: _PayBillContent(bill: bill, state: state),
  );
}

class _PayBillContent extends StatefulWidget {
  final MaintenanceBill bill;
  final SocietyState state;
  const _PayBillContent({required this.bill, required this.state});

  @override
  State<_PayBillContent> createState() => _PayBillContentState();
}

class _PayBillContentState extends State<_PayBillContent> {
  String _selectedMethod = 'UPI (Google Pay / PhonePe)';
  bool _isProcessing = false;

  final _methods = [
    ('UPI (Google Pay / PhonePe)', Icons.qr_code_rounded),
    ('Net Banking / NEFT', Icons.account_balance_rounded),
    ('Debit / Credit Card', Icons.credit_card_rounded),
  ];

  Widget _buildItemRow(BuildContext context, String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context))),
          Text(amount, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Future<void> _handlePayment() async {
    setState(() => _isProcessing = true);
    final record = await widget.state.payBill(
      widget.bill.billNumber,
      paymentMethod: _selectedMethod.split(' ')[0],
    );
    setState(() => _isProcessing = false);

    if (!mounted) return;

    Navigator.pop(context); // Close payment sheet
    if (record != null) {
      showPaymentReceiptModal(context, record, widget.bill);
    } else {
      AppSnackbar.showError(context, 'Payment failed. Please retry.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.bill.amount + widget.bill.lateFee;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Total Amount Banner
        Container(
          padding: AppSpacing.insetAllLg,
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            borderRadius: AppRadii.borderLg,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('TOTAL AMOUNT DUE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryDark)),
                  Text('Includes all society tariff heads', style: TextStyle(fontSize: 10, color: AppColors.primaryDark)),
                ],
              ),
              Text(
                '₹${total.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryDark),
              ),
            ],
          ),
        ),
        AppSpacing.vGapLg,

        // Tariff Heads Breakdown
        const Text('Tariff Heads Breakdown', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        AppSpacing.vGapSm,
        AppCard(
          child: Column(
            children: [
              _buildItemRow(context, 'Society Maintenance (Base)', '₹1,500.00'),
              _buildItemRow(context, 'Sinking & Repair Fund', '₹350.00'),
              _buildItemRow(context, 'Water & Lift Charges', '₹400.00'),
              _buildItemRow(context, 'Parking & Security Charges', '₹200.00'),
              if (widget.bill.lateFee > 0)
                _buildItemRow(context, 'Late Payment Penalty', '₹${widget.bill.lateFee.toStringAsFixed(2)}'),
              const Divider(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Payable', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(
                    '₹${total.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primaryNavy),
                  ),
                ],
              ),
            ],
          ),
        ),
        AppSpacing.vGapLg,

        // Payment Method Selector
        const Text('Choose Payment Method', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        AppSpacing.vGapSm,
        ..._methods.map((m) {
          final isSelected = _selectedMethod == m.$1;
          return AppCard(
            onTap: () => setState(() => _selectedMethod = m.$1),
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            borderColor: isSelected ? AppColors.accentTeal : null,
            child: Row(
              children: [
                Icon(m.$2, color: isSelected ? AppColors.accentTeal : Colors.grey, size: 22),
                AppSpacing.hGapMd,
                Expanded(
                  child: Text(
                    m.$1,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ),
                if (isSelected)
                  const Icon(Icons.check_circle_rounded, color: AppColors.accentTeal, size: 20)
                else
                  const Icon(Icons.circle_outlined, color: Colors.grey, size: 20),
              ],
            ),
          );
        }),
        AppSpacing.vGapLg,

        AppButton.secondary(
          label: 'Pay ₹${total.toStringAsFixed(2)} via ${_selectedMethod.split(" ")[0]}',
          icon: Icons.lock_outline_rounded,
          isLoading: _isProcessing,
          onPressed: _handlePayment,
        ),
      ],
    );
  }
}
