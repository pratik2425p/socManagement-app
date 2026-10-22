import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../services/society_state.dart';
import '../../theme/app_theme.dart';

class AccountantDashboard extends StatelessWidget {
  final SocietyState state;
  const AccountantDashboard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    // Vouchers approved by Chairman, ready for Accountant to write to General Ledger
    final approvedVouchers = state.vouchers.where((v) => v.status == VoucherStatus.approved).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Accountant Header Card
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F766E), Color(0xFF115E59)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.account_balance, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Financial Accounting & Ledger',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Sole Authorized Ledger Writer • Sunil Mehta',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Accountant',
                    style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Financial Overview Cards
          Row(
            children: [
              Expanded(
                child: _buildFinanceCard(
                  title: 'Bank Balance',
                  amount: '₹7,80,450',
                  subtitle: 'SBI Society A/c',
                  color: AppTheme.accentTeal,
                  icon: Icons.account_balance_wallet,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildFinanceCard(
                  title: 'Cash in Hand',
                  amount: '₹18,200',
                  subtitle: 'Petty Cash Box',
                  color: AppTheme.infoBlue,
                  icon: Icons.payments_outlined,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildFinanceCard(
                  title: 'Receivables',
                  amount: '₹11,750',
                  subtitle: '5 Flats Pending',
                  color: AppTheme.warningOrange,
                  icon: Icons.hourglass_top,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Billing Quick Actions
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.note_add_outlined, size: 18),
                  label: const Text('Generate Monthly Bills'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryNavy,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('October 2026 Maintenance Bills Generated for all 35 Flats!'),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.file_download_outlined, color: AppTheme.primaryNavy, size: 18),
                  label: const Text('Export Balance Sheet'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: AppTheme.primaryNavy),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Exporting Financial Statement (PDF/Excel)...')),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),

          // Section 1: Approved Vouchers Pending Ledger Posting (Accountant Only!)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Approved Vouchers Ready to Post',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  if (approvedVouchers.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppTheme.accentTeal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${approvedVouchers.length} READY',
                        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
              const Text(
                'Debit / Credit Lines',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (approvedVouchers.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline, color: AppTheme.successGreen),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'All approved vouchers have been posted to General Ledger.',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            ...approvedVouchers.map((v) => Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: AppTheme.successGreen.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${v.voucherNumber} • APPROVED BY CHAIRMAN',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.successGreen,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            Text(
                              '₹${v.amount.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppTheme.primaryNavy,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          v.title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          v.description,
                          style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.swap_horiz, size: 18, color: AppTheme.primaryNavy),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Dr: Maintenance & Repairs A/c (₹${v.amount.toInt()})\nCr: Society Bank A/c (₹${v.amount.toInt()})',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Courier',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.post_add, size: 18),
                            label: const Text('Post Journal Entry into General Ledger'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.accentTeal,
                            ),
                            onPressed: () {
                              state.postVoucherToLedger(v.id!);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: AppTheme.accentTeal,
                                  content: Text('Voucher posted to General Ledger! Journal Entry created.'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          const SizedBox(height: 22),

          // Section 2: General Ledger Journal Entries
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'General Ledger (Double-Entry)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${state.ledgerEntries.length} entries',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...state.ledgerEntries.map((e) => Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryNavy.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              e.entryNumber,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryNavy,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Dr: ₹${e.totalDebit.toInt()}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.dangerRed,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Cr: ₹${e.totalCredit.toInt()}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.successGreen,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        e.description,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Posted by: ${e.postedByName}',
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                          ),
                          Text(
                            '${e.entryDate.day}/${e.entryDate.month}/${e.entryDate.year}',
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildFinanceCard({
    required String title,
    required String amount,
    required String subtitle,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(
            amount,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
          ),
          Text(
            subtitle,
            style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
