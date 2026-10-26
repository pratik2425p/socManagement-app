import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../core/core.dart';
import '../../services/society_state.dart';
import '../onboarding/accept_invitation_screen.dart';
import 'widgets/active_user_card.dart';
import 'widgets/create_user_dialog.dart';
import 'widgets/role_selector_chips.dart';

/// Opens the Clean User Profile & Roles Bottom Sheet
void showUserManagementSheet(BuildContext context, SocietyState state) {
  AppBottomSheet.show(
    context: context,
    title: 'User Profiles & Roles',
    subtitle: 'Manage and switch active personas in PostgreSQL',
    isScrollControlled: true,
    child: _UserManagementContent(state: state),
  );
}

class _UserManagementContent extends StatefulWidget {
  final SocietyState state;
  const _UserManagementContent({required this.state});

  @override
  State<_UserManagementContent> createState() => _UserManagementContentState();
}

class _UserManagementContentState extends State<_UserManagementContent> {
  @override
  void initState() {
    super.initState();
    widget.state.addListener(_onStateChange);
  }

  @override
  void dispose() {
    widget.state.removeListener(_onStateChange);
    super.dispose();
  }

  void _onStateChange() {
    if (mounted) setState(() {});
  }

  String _getRoleDisplayName(UserRole role) {
    switch (role) {
      case UserRole.resident:
        return 'Resident';
      case UserRole.guard:
        return 'Guard';
      case UserRole.chairman:
        return 'Chairman';
      case UserRole.committee:
        return 'Committee';
      case UserRole.accountant:
        return 'Accountant';
      case UserRole.admin:
        return 'SaaS Admin';
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final activeUser = state.activeUser;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 1. Active User Card
        ActiveUserCard(
          activeUser: activeUser,
          currentUserName: state.currentUserName,
          currentFlat: state.currentFlat,
          currentRole: state.currentRole,
        ),
        AppSpacing.vGapXl,

        // 2. Quick Role Persona Switcher
        RoleSelectorChips(
          selectedRole: state.currentRole,
          onRoleSelected: (role) => state.setRole(role),
        ),
        AppSpacing.vGapXl,

        // 3. Action Buttons
        AppButton.secondary(
          label: 'Register Fresh User in PostgreSQL',
          icon: Icons.person_add_alt_1_rounded,
          isFullWidth: true,
          onPressed: () => showCreateUserDialog(context, state),
        ),
        AppSpacing.vGapSm,
        AppButton.outline(
          label: 'Have Invitation Code? Accept & Join Flat',
          icon: Icons.vpn_key_rounded,
          isFullWidth: true,
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => AcceptInvitationScreen(state: state)),
            );
          },
        ),
        AppSpacing.vGapXl,

        // 4. Registered Society Members List
        AppSectionHeader(
          title: 'Registered Society Users (${state.users.length})',
          subtitle: 'Tap Switch to adopt any persona',
          trailing: IconButton(
            icon: const Icon(Icons.refresh_rounded, size: 20),
            tooltip: 'Refresh users from server',
            onPressed: () => state.refreshUsers(),
          ),
        ),
        AppSpacing.vGapSm,

        if (state.users.isEmpty)
          AppCard(
            hasShadow: false,
            padding: AppSpacing.insetAllXl,
            child: const Center(
              child: Text(
                'No registered users found in database yet.',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
          )
        else
          ...state.users.map((user) {
            final isActive = activeUser?.id == user.id ||
                (activeUser == null && state.currentUserName == user.fullName);

            return AppCard(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              borderColor: isActive ? AppColors.accentTeal : null,
              color: isActive
                  ? (isDark
                      ? AppColors.accentTealDark.withValues(alpha: 0.2)
                      : AppColors.secondaryContainer.withValues(alpha: 0.4))
                  : null,
              child: Row(
                children: [
                  AppAvatar(
                    name: user.fullName,
                    radius: 20,
                    backgroundColor: isActive ? AppColors.accentTeal : AppColors.primaryNavy,
                  ),
                  AppSpacing.hGapMd,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.fullName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${user.flatNumber != null && user.flatNumber!.isNotEmpty ? "Flat ${user.flatNumber} • " : ""}${user.phone}',
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.hGapSm,
                  AppStatusChip(
                    label: _getRoleDisplayName(user.role),
                    variant: isActive ? AppStatusVariant.success : AppStatusVariant.neutral,
                  ),
                  AppSpacing.hGapSm,
                  if (isActive)
                    const Icon(Icons.check_circle, color: AppColors.success, size: 22)
                  else
                    AppButton.outline(
                      label: 'Switch',
                      height: 36,
                      onPressed: () {
                        state.setActiveUser(user);
                        Navigator.pop(context);
                        AppSnackbar.showInfo(
                          context,
                          'Switched persona to ${user.fullName} (${_getRoleDisplayName(user.role)})',
                        );
                      },
                    ),
                ],
              ),
            );
          }),
        AppSpacing.vGapXl,
      ],
    );
  }
}
