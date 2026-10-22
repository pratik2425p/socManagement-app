import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../services/society_state.dart';
import '../../theme/app_theme.dart';

class ChairmanDashboard extends StatelessWidget {
  final SocietyState state;
  const ChairmanDashboard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final pendingVouchers = state.vouchers.where((v) => v.status == VoucherStatus.pendingApproval).toList();
    final openComplaints = state.complaints.where((c) => c.status != ComplaintStatus.resolved).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chairman Greeting Card
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF)],
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
                  child: Icon(Icons.admin_panel_settings, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Chairman & Committee Portal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.societyName,
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.warningOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Chairman Mode',
                    style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Society Metrics Grid
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  title: 'Total Units',
                  value: '35 Flats',
                  subtitle: '33 Occupied',
                  icon: Icons.apartment,
                  color: AppTheme.primaryNavy,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildMetricCard(
                  title: 'Maint. Collection',
                  value: '88%',
                  subtitle: '₹85.7k / ₹97.5k',
                  icon: Icons.pie_chart,
                  color: AppTheme.successGreen,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildMetricCard(
                  title: 'Open Issues',
                  value: '${openComplaints.length}',
                  subtitle: 'Needs action',
                  icon: Icons.warning_amber_rounded,
                  color: AppTheme.dangerRed,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Action Buttons: Broadcast Notice & Request Voucher
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.campaign, color: AppTheme.primaryNavy),
                  label: const Text('Broadcast Notice'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: AppTheme.primaryNavy),
                  ),
                  onPressed: () => _showBroadcastNoticeDialog(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add_shopping_cart, size: 18),
                  label: const Text('Request Voucher'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accentTeal,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () => _showRequestVoucherDialog(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),

          // Section 1: Voucher Approvals (Core Workflow)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Voucher Approvals',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  if (pendingVouchers.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppTheme.dangerRed,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${pendingVouchers.length} PENDING',
                        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
              Text(
                'Workflow: Approval -> Accountant Post',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (pendingVouchers.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline, color: AppTheme.successGreen),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'All expense vouchers reviewed! No pending requests.',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            ...pendingVouchers.map((v) => Card(
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
                                color: AppTheme.warningOrange.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                v.voucherNumber,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.warningOrange,
                                  fontSize: 12,
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
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.person, size: 14, color: Colors.grey.shade600),
                            const SizedBox(width: 4),
                            Text('Requested by: ${v.requestedByName}',
                                style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                            const Spacer(),
                            Text('Category: ${v.category}',
                                style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                          ],
                        ),
                        const Divider(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.close, size: 16),
                                label: const Text('Reject'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppTheme.dangerRed,
                                  side: const BorderSide(color: AppTheme.dangerRed),
                                ),
                                onPressed: () {
                                  state.rejectVoucher(v.id!, 'Budget limit exceeded for current month.');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Voucher Request Rejected.')),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.check, size: 16),
                                label: const Text('Approve Voucher'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.successGreen,
                                ),
                                onPressed: () {
                                  state.approveVoucher(v.id!);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: AppTheme.successGreen,
                                      content: Text('Voucher Approved! Sent to Accountant for Ledger posting.'),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          const SizedBox(height: 20),

          // Section 2: Complaints Helpdesk
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Complaints & Issues Desk',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${openComplaints.length} active',
                style: const TextStyle(fontWeight: FontWeight.w600, color: AppTheme.dangerRed),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...state.complaints.map((c) => Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: c.status == ComplaintStatus.resolved
                        ? AppTheme.successGreen.withValues(alpha: 0.15)
                        : AppTheme.warningOrange.withValues(alpha: 0.15),
                    child: Icon(
                      c.status == ComplaintStatus.resolved ? Icons.check : Icons.build_circle_outlined,
                      color: c.status == ComplaintStatus.resolved ? AppTheme.successGreen : AppTheme.warningOrange,
                    ),
                  ),
                  title: Text(c.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('Flat ${c.flatNumber} • ${c.reportedByName} • Category: ${c.category}'),
                  trailing: c.status == ComplaintStatus.resolved
                      ? const Chip(
                          label: Text('RESOLVED', style: TextStyle(fontSize: 10, color: Colors.white)),
                          backgroundColor: AppTheme.successGreen,
                        )
                      : TextButton(
                          onPressed: () {
                            state.updateComplaintStatus(c.id!, ComplaintStatus.resolved,
                                notes: 'Fixed by maintenance team.');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Complaint Marked as Resolved!')),
                            );
                          },
                          child: const Text('Mark Solved'),
                        ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
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
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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

  void _showBroadcastNoticeDialog(BuildContext context) {
    final titleCtrl = TextEditingController();
    final contentCtrl = TextEditingController();
    String category = 'General Meeting';
    String priority = 'High';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Broadcast Society Notice'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: priority,
                  decoration: const InputDecoration(labelText: 'Priority'),
                  items: const [
                    DropdownMenuItem(value: 'High', child: Text('High Priority')),
                    DropdownMenuItem(value: 'Urgent', child: Text('Urgent (SMS / Alert)')),
                    DropdownMenuItem(value: 'Normal', child: Text('Normal Circular')),
                  ],
                  onChanged: (val) => setDialogState(() => priority = val!),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(labelText: 'Notice Title'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: contentCtrl,
                  maxLines: 4,
                  decoration: const InputDecoration(labelText: 'Circular Content / Details'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleCtrl.text.isNotEmpty) {
                  state.publishNotice(
                    title: titleCtrl.text,
                    content: contentCtrl.text,
                    category: category,
                    priority: priority,
                  );
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notice Broadcasted to all Residents!')),
                  );
                }
              },
              child: const Text('Broadcast to All'),
            ),
          ],
        ),
      ),
    );
  }

  void _showRequestVoucherDialog(BuildContext context) {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final amountCtrl = TextEditingController();
    String category = 'Maintenance & Repair';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('New Expense Voucher Request'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(labelText: 'Expense Title (e.g. Generator Fuel)'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: amountCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Amount (₹)', prefixText: '₹ '),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descCtrl,
                  maxLines: 2,
                  decoration: const InputDecoration(labelText: 'Vendor & Justification'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final amt = double.tryParse(amountCtrl.text);
                if (titleCtrl.text.isNotEmpty && amt != null) {
                  state.createVoucher(
                    title: titleCtrl.text,
                    description: descCtrl.text,
                    amount: amt,
                    category: category,
                  );
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Voucher Request Submitted!')),
                  );
                }
              },
              child: const Text('Submit Request'),
            ),
          ],
        ),
      ),
    );
  }
}
