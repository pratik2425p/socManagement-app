import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:society_client/society_client.dart';
import '../../services/extended_features.dart';
import '../../services/society_state.dart';
import '../../theme/app_theme.dart';
import '../amenities/amenity_booking_screen.dart';
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
                        'Welcome, ${state.currentUserName}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.currentFlat.isNotEmpty ? 'Flat ${state.currentFlat}' : 'Resident Member',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
          const SizedBox(height: 12),
          // Additional Essential Community Actions
          Row(
            children: [
              Expanded(
                child: _buildQuickCard(
                  icon: Icons.sports_tennis,
                  title: 'Amenities',
                  subtitle: 'Club & Turf',
                  color: const Color(0xFF059669),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => AmenityBookingScreen(state: state)),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickCard(
                  icon: Icons.vpn_key,
                  title: 'My Tenancy',
                  subtitle: 'NOC & Lease',
                  color: const Color(0xFF7E22CE),
                  onTap: () => _showTenancyManagementDialog(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickCard(
                  icon: Icons.receipt_long,
                  title: 'Invoices',
                  subtitle: 'All History',
                  color: const Color(0xFF0F766E),
                  onTap: () => _showBillsDialog(context),
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
                        label: const Text('Pay Maintenance (Itemized Bill & UPI)'),
                        onPressed: () => _showPaymentBreakdownDialog(context, unpaidBills.first),
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
                  onTap: () => _showDigitalGatePassModal(context, v),
                  leading: CircleAvatar(
                    backgroundColor: _statusColor(v.status).withValues(alpha: 0.15),
                    child: Icon(_purposeIcon(v.purpose), color: _statusColor(v.status), size: 20),
                  ),
                  title: Row(
                    children: [
                      Text(v.visitorName, style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(width: 6),
                      const Icon(Icons.qr_code, size: 14, color: AppTheme.accentTeal),
                    ],
                  ),
                  subtitle: Text('${v.purpose} • ${v.phoneNumber} • Tap to view pass'),
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
              onPressed: () async {
                if (nameCtrl.text.isNotEmpty) {
                  final entry = await state.preApproveVisitor(
                    name: nameCtrl.text,
                    phone: phoneCtrl.text.isEmpty ? '9800000000' : phoneCtrl.text,
                    purpose: purpose,
                    vehicle: vehicleCtrl.text.isEmpty ? null : vehicleCtrl.text,
                  );
                  if (!ctx.mounted) return;
                  Navigator.pop(ctx);
                  if (context.mounted && entry != null) {
                    _showDigitalGatePassModal(context, entry);
                  }
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

  void _showDigitalGatePassModal(BuildContext context, VisitorEntry entry) {
    final societyName = state.societyName.isNotEmpty ? state.societyName : 'Housing Society';
    final shareText = 'Hello ${entry.visitorName}, here is your Digital Visitor Gate Pass for Flat ${entry.flatNumber} in $societyName.\n\n🔑 4-Digit Entry OTP: ${entry.passcode ?? "----"}\n🏢 Gate: ${entry.entryGate}\n🕒 Validity: Valid for 4 Hours\n\nPlease show this OTP to security at the gate for fast-track entry.';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Icons.verified, color: AppTheme.successGreen, size: 24),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'DIGITAL VISITOR GATE PASS',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.primaryNavy),
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Text('4-DIGIT ENTRY PASSCODE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryNavy,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      entry.passcode ?? '----',
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Stylized QR Placeholder
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(Icons.qr_code_2, size: 84, color: AppTheme.primaryNavy),
                        Container(
                          padding: const EdgeInsets.all(2),
                          color: Colors.white,
                          child: const Icon(Icons.shield, size: 16, color: AppTheme.accentTeal),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${entry.visitorName} • ${entry.purpose}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.darkSlate),
                  ),
                  Text(
                    'Destination: Flat ${entry.flatNumber} • Gate 1',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Valid for 4 Hours from generation',
                    style: TextStyle(fontSize: 10, color: AppTheme.successGreen, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.copy, size: 16),
                    label: const Text('Copy OTP'),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: entry.passcode ?? ''));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Passcode copied to clipboard!')),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.share, size: 16, color: Colors.white),
                    label: const Text('Share Pass', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF25D366)),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: shareText));
                      Navigator.pop(ctx);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Gate pass message copied! Ready to paste into WhatsApp.')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentBreakdownDialog(BuildContext context, MaintenanceBill bill) {
    String selectedMethod = 'UPI';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) => Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Pay Maintenance Dues', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(ctx)),
                ],
              ),
              const Divider(),
              const SizedBox(height: 6),
              // Itemized Breakdown
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    _buildBillRow('Flat Maintenance Charge', '₹2,200.00'),
                    const SizedBox(height: 6),
                    _buildBillRow('Sinking Fund Contribution', '₹200.00'),
                    const SizedBox(height: 6),
                    _buildBillRow('Common Utility & Water', '₹100.00'),
                    const Divider(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Net Payable', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        Text('₹${bill.amount.toInt()}.00', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: AppTheme.primaryNavy)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              const Text('Payment Method', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              RadioListTile<String>(
                value: 'UPI',
                groupValue: selectedMethod,
                title: const Row(
                  children: [
                    Icon(Icons.qr_code, color: Color(0xFF4F46E5), size: 20),
                    SizedBox(width: 8),
                    Text('UPI (Google Pay, PhonePe, Paytm, BHIM)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  ],
                ),
                onChanged: (val) => setSheetState(() => selectedMethod = val!),
              ),
              RadioListTile<String>(
                value: 'NetBanking',
                groupValue: selectedMethod,
                title: const Row(
                  children: [
                    Icon(Icons.account_balance, color: AppTheme.accentTeal, size: 20),
                    SizedBox(width: 8),
                    Text('Direct Net Banking (HDFC, SBI, ICICI)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  ],
                ),
                onChanged: (val) => setSheetState(() => selectedMethod = val!),
              ),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.lock, size: 16, color: Colors.white),
                  label: Text('Authorize & Pay ₹${bill.amount.toInt()}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accentTeal,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () async {
                    Navigator.pop(ctx);
                    final recorded = await state.payBill(bill.billNumber, paymentMethod: selectedMethod);
                    if (context.mounted && recorded != null) {
                      _showReceiptModal(context, recorded, bill);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBillRow(String label, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
        Text(amount, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }

  void _showReceiptModal(BuildContext context, PaymentRecord rec, MaintenanceBill bill) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundColor: Color(0xFFDCFCE7),
              child: Icon(Icons.check, color: AppTheme.successGreen, size: 36),
            ),
            const SizedBox(height: 12),
            const Text('Payment Successful! 🎉', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            Text('Auto-reconciled into Society General Ledger', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _buildBillRow('Receipt Number', rec.receiptNumber),
                  const SizedBox(height: 6),
                  _buildBillRow('Transaction Ref', rec.transactionReference),
                  const SizedBox(height: 6),
                  _buildBillRow('Billed Flat', 'Flat ${rec.flatNumber}'),
                  const SizedBox(height: 6),
                  _buildBillRow('Payment Mode', rec.paymentMethod),
                  const Divider(height: 16),
                  _buildBillRow('Amount Credited', '₹${rec.amount.toInt()}.00'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTenancyManagementDialog(BuildContext context) {
    final myNocs = state.tenantNocs.where((n) => n.flatNumber == state.currentFlat).toList();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('My Flat Tenancy & NOC', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(ctx)),
              ],
            ),
            const Divider(),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF5FF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE9D5FF)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.vpn_key, color: Color(0xFF7E22CE), size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Flat ${state.currentFlat.isNotEmpty ? state.currentFlat : "A-304"} Tenancy', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Text(myNocs.isNotEmpty ? 'Active Tenant: ${myNocs.first.tenantName}' : 'Owner Occupied (No active tenant recorded)', style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (myNocs.isNotEmpty) ...[
              const Text('Active Tenancy NOC Certificate', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.verified, color: AppTheme.successGreen),
                  title: Text(myNocs.first.tenantName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Lease: ${myNocs.first.leaseStart.day}/${myNocs.first.leaseStart.month}/${myNocs.first.leaseStart.year} - ${myNocs.first.leaseEnd.day}/${myNocs.first.leaseEnd.month}/${myNocs.first.leaseEnd.year} • Rent: ₹${myNocs.first.monthlyRent.toInt()}'),
                  trailing: TextButton(
                    onPressed: () => _showNocCertificateModal(context, myNocs.first),
                    child: const Text('View NOC'),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add_moderator, size: 18, color: Colors.white),
                label: const Text('Register New Tenant & Issue NOC', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7E22CE),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pop(ctx);
                  _showNewTenantNocDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showNewTenantNocDialog(BuildContext context) {
    final tenantNameCtrl = TextEditingController();
    final tenantPhoneCtrl = TextEditingController();
    final rentCtrl = TextEditingController(text: '22000');
    DateTime leaseStart = DateTime.now();
    DateTime leaseEnd = DateTime.now().add(const Duration(days: 335)); // 11 months

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Issue Tenancy Society NOC', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: tenantNameCtrl,
                  decoration: const InputDecoration(labelText: 'Tenant Full Name *', hintText: 'e.g. Rahul S. Patil'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: tenantPhoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Tenant Phone *', hintText: 'e.g. 9811223344'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: rentCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Monthly Rent (₹) *'),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Lease Duration: 11 Months', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    Text('${leaseStart.day}/${leaseStart.month}/${leaseStart.year} - ${leaseEnd.day}/${leaseEnd.month}/${leaseEnd.year}', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7E22CE)),
              onPressed: () {
                if (tenantNameCtrl.text.trim().isEmpty || tenantPhoneCtrl.text.trim().isEmpty) return;

                final noc = state.issueTenantNoc(
                  flatNumber: state.currentFlat.isNotEmpty ? state.currentFlat : 'A-304',
                  ownerName: state.currentUserName.isNotEmpty ? state.currentUserName : 'Owner',
                  ownerPhone: '9822334455',
                  tenantName: tenantNameCtrl.text.trim(),
                  tenantPhone: tenantPhoneCtrl.text.trim(),
                  leaseStart: leaseStart,
                  leaseEnd: leaseEnd,
                  monthlyRent: double.tryParse(rentCtrl.text.trim()) ?? 22000.0,
                );

                Navigator.pop(ctx);
                _showNocCertificateModal(context, noc);
              },
              child: const Text('Issue NOC', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  void _showNocCertificateModal(BuildContext context, TenantNocRecord noc) {
    final socName = state.societyName.isNotEmpty ? state.societyName : 'Housing Society Ltd.';
    final socCode = state.currentSociety?.code ?? 'MH/PUN/2026/CHS';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Icon(Icons.apartment_rounded, color: AppTheme.primaryNavy, size: 32),
                  const SizedBox(height: 4),
                  Text(socName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), textAlign: TextAlign.center),
                  Text('REG: $socCode', style: TextStyle(fontSize: 10, color: Colors.grey.shade600, fontFamily: 'monospace')),
                ],
              ),
            ),
            const Divider(height: 18),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(color: const Color(0xFFF0FDF4), borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xFFBBF7D0))),
                child: const Text('NO OBJECTION CERTIFICATE (NOC)', style: TextStyle(color: AppTheme.successGreen, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'This is to certify that the Management Committee of $socName has No Objection to letting Flat ${noc.flatNumber} on leave & license to ${noc.tenantName} (${noc.tenantPhone}) by flat owner ${noc.ownerName}.',
              style: const TextStyle(fontSize: 12, height: 1.4),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  _buildBillRow('NOC Ref #', noc.nocNumber),
                  _buildBillRow('Lease Period', '11 Months'),
                  _buildBillRow('Expiry Date', '${noc.leaseEnd.day}/${noc.leaseEnd.month}/${noc.leaseEnd.year}'),
                  _buildBillRow('Status', noc.status),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Digitally Certified', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.successGreen)),
                    Text('Secretary / Chairman Stamp', style: TextStyle(fontSize: 9, color: Colors.grey.shade500)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Close'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
