import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

void showPaymentReceiptModal(
  BuildContext context,
  PaymentRecord record,
  MaintenanceBill bill, {
  SocietyState? state,
}) {
  AppBottomSheet.show(
    context: context,
    title: '🧾 Maintenance Payment Receipt',
    subtitle: 'Auto-reconciled with Double-Entry General Ledger',
    child: _ReceiptContent(record: record, bill: bill, state: state),
  );
}

class _ReceiptContent extends StatefulWidget {
  final PaymentRecord record;
  final MaintenanceBill bill;
  final SocietyState? state;

  const _ReceiptContent({
    required this.record,
    required this.bill,
    this.state,
  });

  @override
  State<_ReceiptContent> createState() => _ReceiptContentState();
}

class _ReceiptContentState extends State<_ReceiptContent> {
  bool _isGeneratingPdf = false;

  Widget _buildRow(BuildContext context, String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.bodySmall?.color)),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handlePrint(ReceiptFormat format) async {
    setState(() => _isGeneratingPdf = true);
    try {
      await PdfReceiptGenerator.printReceipt(
        bill: widget.bill,
        record: widget.record,
        society: widget.state?.currentSociety,
        format: format,
      );
    } catch (e) {
      if (mounted) AppSnackbar.showError(context, 'Print error: $e');
    } finally {
      if (mounted) setState(() => _isGeneratingPdf = false);
    }
  }

  Future<void> _handleShare() async {
    setState(() => _isGeneratingPdf = true);
    try {
      await PdfReceiptGenerator.shareReceipt(
        bill: widget.bill,
        record: widget.record,
        society: widget.state?.currentSociety,
      );
    } catch (e) {
      if (mounted) AppSnackbar.showError(context, 'Share error: $e');
    } finally {
      if (mounted) setState(() => _isGeneratingPdf = false);
    }
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
                '₹${widget.record.amount.toStringAsFixed(2)}',
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
              _buildRow(context, 'Transaction ID', widget.record.transactionReference, isBold: true),
              _buildRow(context, 'Receipt Number', widget.record.receiptNumber),
              _buildRow(context, 'Bill Number', widget.bill.billNumber),
              _buildRow(context, 'Billing Month', widget.bill.billingMonth),
              _buildRow(context, 'Flat Number', widget.bill.flatNumber),
              _buildRow(context, 'Payment Mode', widget.record.paymentMethod),
              _buildRow(context, 'Date & Time', widget.record.paymentDate.toString().substring(0, 19)),
              const Divider(height: 20),
              _buildRow(context, 'Status', 'CLEARED & POSTED', isBold: true),
            ],
          ),
        ),
        AppSpacing.vGapLg,

        // PDF Print & Share Actions
        Row(
          children: [
            Expanded(
              child: AppButton.secondary(
                label: 'A4 PDF',
                icon: Icons.print_rounded,
                isLoading: _isGeneratingPdf,
                onPressed: () => _handlePrint(ReceiptFormat.a4),
              ),
            ),
            AppSpacing.hGapSm,
            Expanded(
              child: AppButton.secondary(
                label: '80mm POS',
                icon: Icons.receipt_long_rounded,
                isLoading: _isGeneratingPdf,
                onPressed: () => _handlePrint(ReceiptFormat.thermal80mm),
              ),
            ),
            AppSpacing.hGapSm,
            IconButton.filledTonal(
              tooltip: 'Share PDF Receipt',
              icon: const Icon(Icons.share_rounded),
              onPressed: _isGeneratingPdf ? null : _handleShare,
            ),
          ],
        ),
        AppSpacing.vGapMd,

        AppButton.primary(
          label: 'Done',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
