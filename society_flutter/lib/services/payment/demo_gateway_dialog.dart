import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../core/core.dart';
import '../../screens/dashboard/resident/modals/razorpay_checkout_dialog.dart';
import 'demo_gateway_pill.dart';

/// Interactive Demo Payment Gateway Dialog.
/// Realistic UI replicating payment method tabs (UPI / Card / NetBanking) and
/// an explicit Outcome Simulator for demoing all possible payment states.
class DemoGatewayDialog extends StatefulWidget {
  final RazorpayOrderResponse order;

  const DemoGatewayDialog({super.key, required this.order});

  static Future<RazorpayCheckoutResult?> show(
    BuildContext context,
    RazorpayOrderResponse order,
  ) {
    if (kReleaseMode) {
      throw StateError('DemoGatewayDialog is prohibited in release builds.');
    }
    return showModalBottomSheet<RazorpayCheckoutResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => DemoGatewayDialog(order: order),
    );
  }

  @override
  State<DemoGatewayDialog> createState() => _DemoGatewayDialogState();
}

class _DemoGatewayDialogState extends State<DemoGatewayDialog>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  RazorpayOutcome _simulatedOutcome = RazorpayOutcome.success;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _submitOutcome() async {
    setState(() => _isProcessing = true);
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;

    final outcome = _simulatedOutcome;
    final paymentId = 'pay_demo_${DateTime.now().millisecondsSinceEpoch}';
    final signature = 'sig_demo_sha256_${DateTime.now().millisecondsSinceEpoch}';

    Navigator.pop(
      context,
      RazorpayCheckoutResult(
        outcome: outcome,
        paymentId: outcome == RazorpayOutcome.success ? paymentId : null,
        signature: outcome == RazorpayOutcome.success ? signature : null,
        errorMessage: outcome == RazorpayOutcome.failed
            ? 'Bank server timed out during authentication (Simulated)'
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final amountRupees = widget.order.amountRupees.toStringAsFixed(2);

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : Colors.white,
        borderRadius: AppRadii.topSheet,
      ),
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.md,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Drag handle & Demo Ribbon Tag
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.warningContainer,
                  borderRadius: AppRadii.borderFull,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.science_outlined, size: 14, color: AppColors.warning),
                    SizedBox(width: 4),
                    Text(
                      'SIMULATED DEMO GATEWAY',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.warning,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => Navigator.pop(
                  context,
                  const RazorpayCheckoutResult(outcome: RazorpayOutcome.cancelled),
                ),
              ),
            ],
          ),
          AppSpacing.vGapSm,
          // Amount & Society Banner
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Grand Horizon Heights CHS', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Maintenance Invoice #${widget.order.billId}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              Text(
                '₹$amountRupees',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryNavy),
              ),
            ],
          ),
          AppSpacing.vGapMd,
          const Divider(),
          // Method Tabs
          TabBar(
            controller: _tabController,
            labelColor: AppColors.primaryNavy,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.accentTeal,
            tabs: const [
              Tab(icon: Icon(Icons.qr_code_2_rounded, size: 18), text: 'UPI / QR'),
              Tab(icon: Icon(Icons.credit_card_rounded, size: 18), text: 'Cards'),
              Tab(icon: Icon(Icons.account_balance_rounded, size: 18), text: 'NetBanking'),
            ],
          ),
          SizedBox(
            height: 120,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildUpiTab(),
                _buildCardsTab(),
                _buildNetBankingTab(),
              ],
            ),
          ),
          AppSpacing.vGapMd,
          // Outcome Simulator Bar
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
              borderRadius: AppRadii.borderMd,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Simulation Test Selector:',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.grey),
                ),
                AppSpacing.vGapXs,
                Row(
                  children: [
                    _outcomeChip('Success', RazorpayOutcome.success, Colors.green),
                    AppSpacing.hGapXs,
                    _outcomeChip('Failure', RazorpayOutcome.failed, Colors.red),
                    AppSpacing.hGapXs,
                    _outcomeChip('Pending', RazorpayOutcome.pending, Colors.orange),
                    AppSpacing.hGapXs,
                    _outcomeChip('Cancel', RazorpayOutcome.cancelled, Colors.grey),
                  ],
                ),
              ],
            ),
          ),
          AppSpacing.vGapLg,
          AppButton.primary(
            label: _simulatedOutcome == RazorpayOutcome.success
                ? 'Simulate Payment Success (₹$amountRupees)'
                : 'Simulate ${_simulatedOutcome.name.toUpperCase()}',
            isLoading: _isProcessing,
            onPressed: _isProcessing ? null : _submitOutcome,
          ),
        ],
      ),
    );
  }

  Widget _outcomeChip(String label, RazorpayOutcome outcome, Color color) {
    final selected = _simulatedOutcome == outcome;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _simulatedOutcome = outcome),
        borderRadius: AppRadii.borderSm,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: selected ? color.withValues(alpha: 0.15) : Colors.transparent,
            border: Border.all(color: selected ? color : Colors.transparent, width: 1.5),
            borderRadius: AppRadii.borderSm,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                color: selected ? color : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpiTab() {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PaymentBrandPill(label: 'Google Pay', icon: Icons.g_mobiledata_rounded),
          PaymentBrandPill(label: 'PhonePe', icon: Icons.flash_on_rounded),
          PaymentBrandPill(label: 'Paytm UPI', icon: Icons.account_balance_wallet_rounded),
        ],
      ),
    );
  }

  Widget _buildCardsTab() {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PaymentBrandPill(label: 'Visa Debit (•••• 4022)', icon: Icons.credit_card_rounded),
          PaymentBrandPill(label: 'Mastercard (•••• 8910)', icon: Icons.credit_card_rounded),
        ],
      ),
    );
  }

  Widget _buildNetBankingTab() {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PaymentBrandPill(label: 'HDFC Bank', icon: Icons.account_balance_rounded),
          PaymentBrandPill(label: 'ICICI Bank', icon: Icons.account_balance_rounded),
          PaymentBrandPill(label: 'SBI Corporate', icon: Icons.account_balance_rounded),
        ],
      ),
    );
  }
}
