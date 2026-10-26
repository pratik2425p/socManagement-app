import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:society_client/society_client.dart';
import '../../core/core.dart';
import '../../services/society_state.dart';
import 'accept_invitation_screen.dart';

/// Redesigned Member Invitations Engine & Code Generator (<280 lines)
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

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Create Member Invitation'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  controller: flatCtrl,
                  label: 'Flat Number *',
                  hint: 'e.g. A-301',
                  prefixIcon: const Icon(Icons.home_outlined, size: 20),
                ),
                AppSpacing.vGapMd,
                AppTextField(
                  controller: nameCtrl,
                  label: 'Member Full Name *',
                  hint: 'e.g. Ramesh Kadam',
                  prefixIcon: const Icon(Icons.person_outline, size: 20),
                ),
                AppSpacing.vGapMd,
                AppTextField(
                  controller: phoneCtrl,
                  label: 'Mobile Number *',
                  hint: 'e.g. 9822334455',
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(Icons.phone_outlined, size: 20),
                ),
                AppSpacing.vGapMd,
                AppTextField(
                  controller: emailCtrl,
                  label: 'Email (Optional)',
                  hint: 'e.g. ramesh@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined, size: 20),
                ),
                AppSpacing.vGapMd,
                DropdownButtonFormField<UserRole>(
                  initialValue: selectedRole,
                  decoration: InputDecoration(
                    labelText: 'Assigned Role',
                    border: OutlineInputBorder(borderRadius: AppRadii.borderMd),
                  ),
                  items: const [
                    DropdownMenuItem(value: UserRole.resident, child: Text('🏠 Flat Owner / Resident')),
                    DropdownMenuItem(value: UserRole.committee, child: Text('👥 Committee Member')),
                    DropdownMenuItem(value: UserRole.guard, child: Text('🛡️ Security Guard')),
                    DropdownMenuItem(value: UserRole.accountant, child: Text('📊 Accountant')),
                  ],
                  onChanged: (val) {
                    if (val != null) setDialogState(() => selectedRole = val);
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
                if (nameCtrl.text.trim().isEmpty || phoneCtrl.text.trim().isEmpty) return;

                final invite = await widget.state.sendInvitation(
                  flatNumber: flatCtrl.text.trim().isNotEmpty ? flatCtrl.text.trim().toUpperCase() : 'A-101',
                  inviteeName: nameCtrl.text.trim(),
                  phone: phoneCtrl.text.trim(),
                  email: emailCtrl.text.trim().isNotEmpty ? emailCtrl.text.trim() : null,
                  role: selectedRole,
                  occupancyType: 'owner',
                );

                if (ctx.mounted) {
                  Navigator.pop(ctx);
                  if (invite != null) {
                    AppSnackbar.showSuccess(ctx, 'Invitation created! Code: ${invite.inviteCode}');
                  }
                }
              },
              child: const Text('Create Invitation'),
            ),
          ],
        ),
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
      appBar: AppAppBar(
        title: 'Member Invitations Engine',
        subtitle: 'Onboard flat owners, tenants & committee members',
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh',
            onPressed: () => state.refreshInvitations(),
          ),
          IconButton(
            icon: const Icon(Icons.phonelink_setup_rounded),
            tooltip: 'Test Join Flow',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => AcceptInvitationScreen(state: state)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // KPI Stat Cards
            Row(
              children: [
                Expanded(
                  child: AppMetricTile(
                    title: 'Total Invites',
                    value: '${allInvites.length}',
                    icon: Icons.mail_outline_rounded,
                    accentColor: AppColors.primaryNavy,
                  ),
                ),
                AppSpacing.hGapSm,
                Expanded(
                  child: AppMetricTile(
                    title: 'Pending',
                    value: '$pendingCount',
                    icon: Icons.hourglass_top_rounded,
                    accentColor: AppColors.warning,
                  ),
                ),
                AppSpacing.hGapSm,
                Expanded(
                  child: AppMetricTile(
                    title: 'Joined',
                    value: '$acceptedCount',
                    icon: Icons.verified_user_rounded,
                    accentColor: AppColors.success,
                  ),
                ),
              ],
            ),
            AppSpacing.vGapLg,

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: AppButton.primary(
                    label: 'Add Single Invite',
                    icon: Icons.add_rounded,
                    onPressed: _showSingleInviteDialog,
                  ),
                ),
                AppSpacing.hGapSm,
                Expanded(
                  child: AppButton.secondary(
                    label: 'Test Accept Code',
                    icon: Icons.vpn_key_rounded,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => AcceptInvitationScreen(state: state)),
                    ),
                  ),
                ),
              ],
            ),
            AppSpacing.vGapLg,

            // Filter Chips Bar
            Row(
              children: [
                const Text('Filter: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                AppSpacing.hGapSm,
                ...['All', 'Pending', 'Accepted'].map((f) {
                  final isSelected = _filter == f;
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      label: Text(f),
                      selected: isSelected,
                      selectedColor: AppColors.primaryContainer,
                      labelStyle: TextStyle(
                        color: isSelected ? AppColors.primaryNavy : AppColors.textSecondary(context),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 12,
                      ),
                      onSelected: (_) => setState(() => _filter = f),
                    ),
                  );
                }),
              ],
            ),
            AppSpacing.vGapMd,

            // Invitations List
            if (filteredInvites.isEmpty)
              const AppEmptyState(
                icon: Icons.mail_lock_outlined,
                title: 'No Invitations in Filter',
                message: 'Tap "+ Add Single Invite" to generate an onboarding code.',
              )
            else
              ...filteredInvites.map((inv) {
                final isAccepted = inv.status == 'accepted';

                return AppCard(
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  borderColor: isAccepted ? AppColors.successBorder : null,
                  color: isAccepted ? AppColors.successContainer.withValues(alpha: 0.3) : null,
                  child: Row(
                    children: [
                      AppAvatar(
                        name: inv.inviteeName,
                        radius: 20,
                        backgroundColor: isAccepted ? AppColors.success : AppColors.primaryNavy,
                      ),
                      AppSpacing.hGapMd,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              inv.inviteeName,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              'Flat ${inv.flatNumber} • ${inv.phone}',
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            AppSpacing.vGapXs,
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F5F9),
                                borderRadius: AppRadii.borderSm,
                              ),
                              child: Text(
                                'Code: ${inv.inviteCode}',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppSpacing.hGapSm,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppStatusChip(
                            label: inv.status,
                            variant: isAccepted ? AppStatusVariant.success : AppStatusVariant.warning,
                          ),
                          AppSpacing.vGapXs,
                          AppButton.text(
                            label: 'Copy Code',
                            icon: Icons.copy_rounded,
                            height: 32,
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: inv.inviteCode));
                              AppSnackbar.showSuccess(context, 'Copied ${inv.inviteCode} to clipboard!');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            AppSpacing.vGapXxl,
          ],
        ),
      ),
    );
  }
}
