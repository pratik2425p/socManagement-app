import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/payment/payment_gateway.dart';
import '../../../../services/society_state.dart';
import 'payment_receipt_modal.dart';
import 'payment_status_view.dart';
import 'razorpay_checkout_dialog.dart';

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
  String _selectedMethod = 'Razorpay UPI (GPay / PhonePe)';
  PaymentFlowStatus _status = PaymentFlowStatus.idle;
  String? _errorMessage;

  final _methods = [
    ('Razorpay UPI (GPay / PhonePe)', Icons.qr_code_rounded),
    ('Razorpay Net Banking / NEFT', Icons.account_balance_rounded),
    ('Razorpay Cards (Debit / Credit)', Icons.credit_card_rounded),
  ];

  Widget _buildItemRow(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.bodySmall?.color)),
          Text(amount, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Future<void> _handlePayment() async {
    setState(() {
      _status = PaymentFlowStatus.creatingOrder;
      _errorMessage = null;
    });

    // 1. Create order on server (amount computed server-side)
    final order = await widget.state.createPaymentOrder(widget.bill.id ?? 1);

    if (!mounted) return;
    if (order == null) {
      setState(() {
        _status = PaymentFlowStatus.failed;
        _errorMessage = 'Could not initiate payment order with the server. Please try again.';
      });
      return;
    }

    // 2. Open payment gateway (Demo or Razorpay)
    final checkoutResult = await PaymentGatewayFactory.getGateway().openCheckout(context, order);

    if (!mounted) return;

    if (checkoutResult == null || checkoutResult.outcome == RazorpayOutcome.cancelled) {
      setState(() => _status = PaymentFlowStatus.cancelled);
      return;
    }

    if (checkoutResult.outcome == RazorpayOutcome.failed) {
      setState(() {
        _status = PaymentFlowStatus.failed;
        _errorMessage = checkoutResult.errorMessage ?? 'Payment transaction was declined.';
      });
      return;
    }

    if (checkoutResult.outcome == RazorpayOutcome.pending) {
      setState(() {
        _status = PaymentFlowStatus.pending;
        _errorMessage = checkoutResult.errorMessage ?? 'Payment is pending bank authorization.';
      });
      return;
    }

    // 3. Verify Payment on Server
    setState(() => _status = PaymentFlowStatus.verifying);

    final verification = await widget.state.verifyPayment(
      orderId: order.orderId,
      paymentId: checkoutResult.paymentId!,
      signature: checkoutResult.signature!,
    );

    if (!mounted) return;

    if (verification != null && verification.success && verification.paymentRecord != null) {
      Navigator.pop(context); // Close payment sheet
      showPaymentReceiptModal(
        context,
        verification.paymentRecord!,
        verification.bill ?? widget.bill,
      );
    } else {
      setState(() {
        _status = PaymentFlowStatus.failed;
        _errorMessage = verification?.message ?? 'Payment verification failed.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_status != PaymentFlowStatus.idle) {
      return PaymentStatusView(
        status: _status,
        errorMessage: _errorMessage,
        onRetry: _handlePayment,
        onCancel: () => setState(() => _status = PaymentFlowStatus.idle),
      );
    }

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
              _buildItemRow('Society Maintenance (Base)', '₹1,500.00'),
              _buildItemRow('Sinking & Repair Fund', '₹350.00'),
              _buildItemRow('Water & Lift Charges', '₹400.00'),
              _buildItemRow('Parking & Security Charges', '₹200.00'),
              if (widget.bill.lateFee > 0)
                _buildItemRow('Late Payment Penalty', '₹${widget.bill.lateFee.toStringAsFixed(2)}'),
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
        const Text('Payment Gateway (Razorpay)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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

        AppButton.primary(
          label: 'Proceed to Pay ₹${total.toStringAsFixed(2)}',
          icon: Icons.lock_outline_rounded,
          isFullWidth: true,
          onPressed: _handlePayment,
        ),
      ],
    );
  }
}
