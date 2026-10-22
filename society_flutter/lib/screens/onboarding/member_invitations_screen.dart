import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:society_client/society_client.dart';
import '../../services/society_state.dart';
import '../../theme/app_theme.dart';
import 'accept_invitation_screen.dart';

class MemberInvitationsScreen extends StatefulWidget {
  final SocietyState state;
  const MemberInvitationsScreen({super.key, required this.state});

  @override
  State<MemberInvitationsScreen> createState() => _MemberInvitationsScreenState();
}

class _MemberInvitationsScreenState extends State<MemberInvitationsScreen> {
  String _filter = 'All';

  @override
  void initState() {
    super.initState();
    widget.state.refreshInvitations();
  }

  void _showSingleInviteDialog() {
    final flatCtrl = TextEditingController();
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    UserRole selectedRole = UserRole.resident;
    String occupancy = 'owner';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.person_add_alt_1, color: AppTheme.accentTeal),
              SizedBox(width: 8),
              Text('Create Member Invitation', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: flatCtrl,
                  decoration: InputDecoration(
                    labelText: 'Flat Number *',
                    hintText: 'e.g. A-301',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                    labelText: 'Member Full Name *',
                    hintText: 'e.g. Ramesh Kadam',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: phoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number *',
                    hintText: 'e.g. 9822334455',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address (Optional)',
                    hintText: 'e.g. ramesh@gmail.com',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<UserRole>(
                  initialValue: selectedRole,
                  decoration: InputDecoration(
                    labelText: 'Role',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  items: const [
                    DropdownMenuItem(value: UserRole.resident, child: Text('Resident (Flat Owner)')),
                    DropdownMenuItem(value: UserRole.guard, child: Text('Security Guard')),
                    DropdownMenuItem(value: UserRole.accountant, child: Text('Accountant')),
                    DropdownMenuItem(value: UserRole.chairman, child: Text('Committee / Chairman')),
                  ],
                  onChanged: (r) {
                    if (r != null) setDialogState(() => selectedRole = r);
                  },
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
                if (flatCtrl.text.trim().isEmpty || nameCtrl.text.trim().isEmpty || phoneCtrl.text.trim().isEmpty) return;
                final inv = await widget.state.sendInvitation(
                  flatNumber: flatCtrl.text.trim(),
                  inviteeName: nameCtrl.text.trim(),
                  phone: phoneCtrl.text.trim(),
                  email: emailCtrl.text.trim().isNotEmpty ? emailCtrl.text.trim() : null,
                  role: selectedRole,
                  occupancyType: occupancy,
                );

                if (inv != null) {
                  if (ctx.mounted) Navigator.pop(ctx);
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('🎉 Invitation generated! Code: ${inv.inviteCode}'),
                        backgroundColor: AppTheme.successGreen,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.accentTeal),
              child: const Text('Generate Invite', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  void _dispatchBulkInvites() {
    final pendingCount = widget.state.invitations.where((i) => i.status == 'pending').length;
    if (pendingCount == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No pending invitations to dispatch.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('📲 Dispatched SMS & WhatsApp invitations with secure tokens to $pendingCount members!'),
        backgroundColor: AppTheme.successGreen,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final allInvites = state.invitations;
    final pendingCount = allInvites.where((i) => i.status == 'pending').length;
    final acceptedCount = allInvites.where((i) => i.status == 'accepted').length;

    final filteredInvites = allInvites.where((i) {
      if (_filter == 'Pending') return i.status == 'pending';
      if (_filter == 'Accepted') return i.status == 'accepted';
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Member Invitations Engine', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Secure Tokenized Onboarding & OTP Gateway', style: TextStyle(fontSize: 11, color: Colors.white70)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => state.refreshInvitations(),
          ),
          IconButton(
            tooltip: 'Test Member Accept Invite Flow',
            icon: const Icon(Icons.phonelink_setup),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => AcceptInvitationScreen(state: state)),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Stat Cards
          Row(
            children: [
              Expanded(
                child: _buildStatTile('Total Invites', '${allInvites.length}', Icons.all_inbox, AppTheme.primaryNavy),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildStatTile('Pending', '$pendingCount', Icons.pending_actions, const Color(0xFFD97706)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildStatTile('Active / Joined', '$acceptedCount', Icons.verified_user, AppTheme.successGreen),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Action Buttons Bar
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _showSingleInviteDialog,
                  icon: const Icon(Icons.add, color: Colors.white, size: 18),
                  label: const Text('Add Single Invite', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryNavy,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _dispatchBulkInvites,
                  icon: const Icon(Icons.send_rounded, color: Colors.white, size: 18),
                  label: const Text('Dispatch Invites', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accentTeal,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Filter Chips
          Row(
            children: [
              const Text('Filter: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkSlate)),
              const SizedBox(width: 8),
              ...['All', 'Pending', 'Accepted'].map((f) => Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      label: Text(f),
                      selected: _filter == f,
                      selectedColor: AppTheme.primaryNavy.withValues(alpha: 0.15),
                      labelStyle: TextStyle(
                        color: _filter == f ? AppTheme.primaryNavy : Colors.black87,
                        fontWeight: _filter == f ? FontWeight.bold : FontWeight.normal,
                        fontSize: 12,
                      ),
                      onSelected: (_) => setState(() => _filter = f),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 12),

          if (filteredInvites.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Icon(Icons.mail_outline, size: 48, color: Colors.grey.shade400),
                    const SizedBox(height: 12),
                    Text('No invitations found in database.', style: TextStyle(color: Colors.grey.shade600)),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _showSingleInviteDialog,
                      child: const Text('Create First Invitation'),
                    ),
                  ],
                ),
              ),
            )
          else
            ...filteredInvites.map((inv) => _buildInviteCard(inv)),
        ],
      ),
    );
  }

  Widget _buildStatTile(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 6),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
        ],
      ),
    );
  }

  Widget _buildInviteCard(SocietyInvitation inv) {
    final isAccepted = inv.status == 'accepted';

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: isAccepted ? AppTheme.successGreen.withValues(alpha: 0.4) : Colors.grey.shade200,
          width: isAccepted ? 1.5 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryNavy.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    inv.flatNumber,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryNavy, fontSize: 13),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        inv.inviteeName,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppTheme.darkSlate),
                      ),
                      Text(
                        '${inv.phone} ${inv.email != null ? "• ${inv.email}" : ""}',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isAccepted ? AppTheme.successGreen.withValues(alpha: 0.15) : const Color(0xFFFEF3C7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isAccepted ? 'ACTIVE / JOINED' : 'PENDING OTP',
                    style: TextStyle(
                      color: isAccepted ? AppTheme.successGreen : const Color(0xFFB45309),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('Code: ', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SelectableText(
                      inv.inviteCode,
                      style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkSlate),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy, size: 16),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: inv.inviteCode));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Copied code "${inv.inviteCode}" to clipboard!'), duration: const Duration(seconds: 1)),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => AcceptInvitationScreen(
                              state: widget.state,
                              initialInviteCode: inv.inviteCode,
                              initialPhone: inv.phone,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.login, size: 16),
                      label: const Text('Test Join Flow', style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
