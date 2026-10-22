import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../services/society_state.dart';
import '../../theme/app_theme.dart';
import '../profile/user_management_sheet.dart';

class ResidentDashboard extends StatelessWidget {
  final SocietyState state;
  const ResidentDashboard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final unpaidBills = state.bills.where((b) => b.status == BillStatus.unpaid).toList();
    final myVisitors = state.visitors.where((v) => v.flatNumber == state.currentFlat).toList();
    final waitingApproval = myVisitors.where((v) => v.status == VisitorStatus.waitingApproval).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting & Flat Info Card
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.primaryNavy, Color(0xFF1E5B99)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  child: const Icon(Icons.home_outlined, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Namaste, ${state.currentUserName}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Flat ${state.currentFlat} • Wing A',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => showUserManagementSheet(context, state),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.accentTeal,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.manage_accounts, color: Colors.white, size: 14),
                        SizedBox(width: 4),
                        Text(
                          'Profiles',
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Real-time Gate Approval Alert (if visitor waiting at gate)
          if (waitingApproval.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFFCA5A5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.notifications_active, color: AppTheme.dangerRed),
                      const SizedBox(width: 8),
                      const Text(
                        'Gate Bell: Visitor Request!',
                        style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.dangerRed, fontSize: 15),
                      ),
                      const Spacer(),
                      Text(
                        'Just now',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${waitingApproval.first.visitorName} (${waitingApproval.first.purpose}) is at Main Gate requesting entry for Flat ${state.currentFlat}.',
                    style: const TextStyle(fontSize: 14, color: AppTheme.darkSlate),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            state.updateVisitorStatus(waitingApproval.first.id!, VisitorStatus.rejected);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Visitor Entry Denied')),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.dangerRed,
                            side: const BorderSide(color: AppTheme.dangerRed),
                          ),
                          child: const Text('Deny Entry'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            state.updateVisitorStatus(waitingApproval.first.id!, VisitorStatus.inside);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Visitor Approved! Gate Opened.')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.successGreen,
                          ),
                          child: const Text('Approve & Open'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
          ],

          // Quick Action Grid
          Row(
            children: [
              Expanded(
                child: _buildQuickCard(
                  icon: Icons.qr_code_scanner,
                  title: 'Pre-Approve',
                  subtitle: 'Guest / Delivery',
                  color: AppTheme.accentTeal,
                  onTap: () => _showPreApproveDialog(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickCard(
                  icon: Icons.payment,
                  title: 'Maintenance',
                  subtitle: unpaidBills.isNotEmpty ? '₹${unpaidBills.first.amount.toInt()} Due' : 'Paid',
                  color: unpaidBills.isNotEmpty ? AppTheme.warningOrange : AppTheme.successGreen,
                  onTap: () => _showBillsDialog(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickCard(
                  icon: Icons.report_problem_outlined,
                  title: 'Complaint',
                  subtitle: 'Report Issue',
                  color: AppTheme.infoBlue,
                  onTap: () => _showComplaintDialog(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildQuickCard(
                  icon: Icons.how_to_vote,
                  title: 'Resolutions',
                  subtitle: '1 Flat = 1 Vote',
                  color: AppTheme.primaryNavy,
                  onTap: () {
                    Navigator.pushNamed(context, '/polling');
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickCard(
                  icon: Icons.folder_shared,
                  title: 'Doc Vault',
                  subtitle: 'Bye-Laws & Audits',
                  color: const Color(0xFF4F46E5),
                  onTap: () {
                    Navigator.pushNamed(context, '/documents');
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickCard(
                  icon: Icons.sos,
                  title: 'EMERGENCY',
                  subtitle: 'Instant Alarm',
                  color: AppTheme.dangerRed,
                  onTap: () => _showSosDialog(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Maintenance Bill Summary
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Maintenance Dues',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: unpaidBills.isNotEmpty
                              ? AppTheme.warningOrange.withValues(alpha: 0.15)
                              : AppTheme.successGreen.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          unpaidBills.isNotEmpty ? 'Payment Pending' : 'All Clear',
                          style: TextStyle(
                            color: unpaidBills.isNotEmpty ? AppTheme.warningOrange : AppTheme.successGreen,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (unpaidBills.isNotEmpty) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              unpaidBills.first.billingMonth,
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                            Text(
                              'Due date: 31 Oct 2026',
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                            ),
                          ],
                        ),
                        Text(
                          '₹${unpaidBills.first.amount.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryNavy,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.flash_on, size: 18),
                        label: const Text('Pay Maintenance via UPI'),
                        onPressed: () {
                          state.payBill(unpaidBills.first.billNumber);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Payment Successful! Receipt generated.')),
                          );
                        },
                      ),
                    ),
                  ] else ...[
                    const Text('No pending dues. Thank you for timely maintenance payments!'),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Active Visitor Passcodes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'My Active Gate Passes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () => _showPreApproveDialog(context),
                child: const Text('+ New Pass'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...myVisitors.map((v) => Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _statusColor(v.status).withValues(alpha: 0.15),
                    child: Icon(_purposeIcon(v.purpose), color: _statusColor(v.status), size: 20),
                  ),
                  title: Text(v.visitorName, style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${v.purpose} • ${v.phoneNumber}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (v.passcode != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryNavy.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'OTP: ${v.passcode}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryNavy,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      const SizedBox(height: 4),
                      Text(
                        v.status.name.toUpperCase(),
                        style: TextStyle(
                          color: _statusColor(v.status),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(height: 20),

          // Society Notices
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Society Notices',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          ...state.notices.map((n) => Card(
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
                              color: n.priority == 'High' || n.priority == 'Urgent'
                                  ? AppTheme.dangerRed.withValues(alpha: 0.1)
                                  : AppTheme.infoBlue.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              n.category,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: n.priority == 'High' || n.priority == 'Urgent'
                                    ? AppTheme.dangerRed
                                    : AppTheme.infoBlue,
                              ),
                            ),
                          ),
                          Text(
                            'Posted by ${n.postedByName}',
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        n.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        n.content,
                        style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildQuickCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderLight),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color.withValues(alpha: 0.12),
              radius: 20,
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Color _statusColor(VisitorStatus status) {
    switch (status) {
      case VisitorStatus.inside:
        return AppTheme.successGreen;
      case VisitorStatus.waitingApproval:
        return AppTheme.dangerRed;
      case VisitorStatus.expected:
        return AppTheme.infoBlue;
      case VisitorStatus.exited:
        return Colors.grey;
      case VisitorStatus.rejected:
        return AppTheme.dangerRed;
      case VisitorStatus.approved:
        return AppTheme.successGreen;
    }
  }

  IconData _purposeIcon(String purpose) {
    switch (purpose.toLowerCase()) {
      case 'delivery':
        return Icons.delivery_dining;
      case 'cab':
        return Icons.local_taxi;
      case 'service':
        return Icons.build;
      default:
        return Icons.person;
    }
  }

  void _showPreApproveDialog(BuildContext context) {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final vehicleCtrl = TextEditingController();
    String purpose = 'Guest';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Pre-Approve Visitor'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: purpose,
                  decoration: const InputDecoration(labelText: 'Purpose'),
                  items: const [
                    DropdownMenuItem(value: 'Guest', child: Text('Guest / Family')),
                    DropdownMenuItem(value: 'Delivery', child: Text('Delivery (Swiggy, Amazon)')),
                    DropdownMenuItem(value: 'Cab', child: Text('Cab (Uber, Ola)')),
                    DropdownMenuItem(value: 'Service', child: Text('Home Service / Plumber')),
                  ],
                  onChanged: (val) => setDialogState(() => purpose = val!),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Visitor / Driver Name'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: phoneCtrl,
                  decoration: const InputDecoration(labelText: 'Mobile Number'),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: vehicleCtrl,
                  decoration: const InputDecoration(labelText: 'Vehicle Number (Optional)'),
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
                if (nameCtrl.text.isNotEmpty) {
                  state.preApproveVisitor(
                    name: nameCtrl.text,
                    phone: phoneCtrl.text.isEmpty ? '9800000000' : phoneCtrl.text,
                    purpose: purpose,
                    vehicle: vehicleCtrl.text.isEmpty ? null : vehicleCtrl.text,
                  );
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Visitor Pass Created! Share Passcode with visitor.')),
                  );
                }
              },
              child: const Text('Generate Passcode'),
            ),
          ],
        ),
      ),
    );
  }

  void _showComplaintDialog(BuildContext context) {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    String category = 'Plumbing';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Report an Issue / Complaint'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: category,
                  decoration: const InputDecoration(labelText: 'Category'),
                  items: const [
                    DropdownMenuItem(value: 'Plumbing', child: Text('Plumbing / Water')),
                    DropdownMenuItem(value: 'Electrical', child: Text('Electrical')),
                    DropdownMenuItem(value: 'Lift / Elevator', child: Text('Lift / Elevator')),
                    DropdownMenuItem(value: 'Cleaning', child: Text('Cleaning / Garbage')),
                    DropdownMenuItem(value: 'Security', child: Text('Security')),
                    DropdownMenuItem(value: 'Other', child: Text('Other')),
                  ],
                  onChanged: (val) => setDialogState(() => category = val!),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(labelText: 'Issue Title (e.g. Water leak)'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descCtrl,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: 'Detailed Description'),
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
                  state.addComplaint(
                    title: titleCtrl.text,
                    description: descCtrl.text,
                    category: category,
                  );
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Complaint Registered! Tracking code assigned.')),
                  );
                }
              },
              child: const Text('Submit Complaint'),
            ),
          ],
        ),
      ),
    );
  }

  void _showBillsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Maintenance Invoices',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            ...state.bills.map((b) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.receipt_long, color: AppTheme.primaryNavy),
                  title: Text('${b.billingMonth} • ${b.billNumber}'),
                  subtitle: Text('Due: 31st • Status: ${b.status.name.toUpperCase()}'),
                  trailing: Text(
                    '₹${b.amount.toInt()}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _showSosDialog(BuildContext context) {
    EmergencyType type = EmergencyType.medical;
    final noteCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: const Color(0xFFFEF2F2),
          title: const Row(
            children: [
              Icon(Icons.warning, color: AppTheme.dangerRed, size: 28),
              SizedBox(width: 8),
              Text(
                'TRIGGER EMERGENCY SOS',
                style: TextStyle(color: AppTheme.dangerRed, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'This will immediately sound an audible siren at Main Security Gate and alert the Society Chairman.',
                  style: TextStyle(fontSize: 13, color: AppTheme.darkSlate),
                ),
                const SizedBox(height: 14),
                DropdownButtonFormField<EmergencyType>(
                  initialValue: type,
                  decoration: const InputDecoration(labelText: 'Emergency Category', fillColor: Colors.white),
                  items: const [
                    DropdownMenuItem(value: EmergencyType.medical, child: Text('🚑 Medical Emergency (Ambulance)')),
                    DropdownMenuItem(value: EmergencyType.fire, child: Text('🚒 Fire Outbreak')),
                    DropdownMenuItem(value: EmergencyType.liftStuck, child: Text('🛗 Lift Stuck with Passengers')),
                    DropdownMenuItem(value: EmergencyType.securityThreat, child: Text('🚨 Intruder / Security Threat')),
                    DropdownMenuItem(value: EmergencyType.other, child: Text('⚠️ Other Urgent Emergency')),
                  ],
                  onChanged: (val) => setDialogState(() => type = val!),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: noteCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Quick Note (e.g. 3rd floor lobby)',
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.emergency, color: Colors.white),
              label: const Text('SEND SOS ALARM NOW'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.dangerRed,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onPressed: () {
                state.triggerSos(
                  type: type,
                  note: noteCtrl.text.isEmpty ? null : noteCtrl.text,
                );
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: AppTheme.dangerRed,
                    duration: Duration(seconds: 5),
                    content: Text('🚨 EMERGENCY SOS SENT! Security Guard dispatched to Flat A-304.'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
