import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../core/core.dart';

/// Active User Profile Banner Card
class ActiveUserCard extends StatelessWidget {
  final SocietyUser? activeUser;
  final String currentUserName;
  final String currentFlat;
  final UserRole currentRole;

  const ActiveUserCard({
    super.key,
    required this.activeUser,
    required this.currentUserName,
    required this.currentFlat,
    required this.currentRole,
  });

  String _getRoleDisplayName(UserRole role) {
    switch (role) {
      case UserRole.resident:
        return 'Resident';
      case UserRole.guard:
        return 'Security Guard';
      case UserRole.chairman:
        return 'Chairman / Admin';
      case UserRole.committee:
        return 'Committee Member';
      case UserRole.accountant:
        return 'Accountant';
      case UserRole.admin:
        return 'SaaS Super Admin';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: AppSpacing.insetAllLg,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF1E3A5F), const Color(0xFF0F253E)]
              : [AppColors.primaryNavy, const Color(0xFF1E3A8A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadii.borderXl,
        boxShadow: AppShadows.elevated(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppAvatar(
                name: currentUserName,
                radius: 26,
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primaryNavy,
              ),
              AppSpacing.hGapMd,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            currentUserName.isNotEmpty ? currentUserName : 'Society User',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.accentTeal,
                            borderRadius: AppRadii.borderSm,
                          ),
                          child: const Text(
                            'ACTIVE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Flat: ${currentFlat.isNotEmpty ? currentFlat : "Office"} • ${activeUser?.phone ?? "Phone on file"}',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      activeUser?.email ?? 'society.member@samarth.in',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.75),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppSpacing.vGapMd,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: AppRadii.borderSm,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.badge_outlined, color: Colors.white, size: 15),
                AppSpacing.hGapXs,
                Text(
                  'Role: ${_getRoleDisplayName(currentRole)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
