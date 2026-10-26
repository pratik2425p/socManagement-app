import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../core/core.dart';

/// Quick Role Persona Switcher Chips
class RoleSelectorChips extends StatelessWidget {
  final UserRole selectedRole;
  final ValueChanged<UserRole> onRoleSelected;

  const RoleSelectorChips({
    super.key,
    required this.selectedRole,
    required this.onRoleSelected,
  });

  String _getRoleDisplayName(UserRole role) {
    switch (role) {
      case UserRole.resident:
        return '🏠 Resident';
      case UserRole.guard:
        return '🛡️ Guard';
      case UserRole.chairman:
        return '🏛️ Chairman';
      case UserRole.committee:
        return '👥 Committee';
      case UserRole.accountant:
        return '📊 Accountant';
      case UserRole.admin:
        return '🌐 SaaS Admin';
    }
  }

  Color _getRoleColor(UserRole role) {
    switch (role) {
      case UserRole.resident:
        return AppColors.roleResident;
      case UserRole.guard:
        return AppColors.roleGuard;
      case UserRole.chairman:
        return AppColors.roleChairman;
      case UserRole.committee:
        return AppColors.roleCommittee;
      case UserRole.accountant:
        return AppColors.roleAccountant;
      case UserRole.admin:
        return AppColors.roleAdmin;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(
          title: 'Quick Role Persona Switcher',
          subtitle: 'Simulate app experience for any society stakeholder',
          padding: EdgeInsets.zero,
        ),
        AppSpacing.vGapSm,
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            UserRole.resident,
            UserRole.guard,
            UserRole.chairman,
            UserRole.accountant,
            UserRole.admin,
          ].map((role) {
            final isSelected = selectedRole == role;
            final roleColor = _getRoleColor(role);

            return ChoiceChip(
              label: Text(_getRoleDisplayName(role)),
              selected: isSelected,
              selectedColor: roleColor.withValues(alpha: 0.18),
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.surfaceDark
                  : const Color(0xFFF1F5F9),
              side: BorderSide(
                color: isSelected ? roleColor : Colors.transparent,
                width: 1.5,
              ),
              labelStyle: TextStyle(
                color: isSelected ? roleColor : AppColors.textSecondary(context),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 12,
              ),
              shape: RoundedRectangleBorder(borderRadius: AppRadii.borderMd),
              onSelected: (selected) {
                if (selected) onRoleSelected(role);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
