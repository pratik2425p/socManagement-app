import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../core/core.dart';
import '../services/society_state.dart';
import 'amenities/amenity_booking_screen.dart';
import 'audit/audit_trail_screen.dart';
import 'dashboard/accountant_dashboard.dart';
import 'dashboard/chairman_dashboard.dart';
import 'dashboard/guard_dashboard.dart';
import 'dashboard/resident_dashboard.dart';
import 'dashboard/saas_admin_dashboard.dart';
import 'documents/document_vault_screen.dart';
import 'onboarding/society_setup_wizard_screen.dart';
import 'polling/polling_screen.dart';
import 'profile/user_management_sheet.dart';
import 'saas/super_admin_portal_screen.dart';

/// Central Shell Scaffold with Adaptive Navigation (NavigationRail on Web/Desktop, BottomNav on Mobile)
class HomeScreen extends StatefulWidget {
  final SocietyState state;
  const HomeScreen({super.key, required this.state});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  UserRole? _lastRole;

  @override
  void initState() {
    super.initState();
    _lastRole = widget.state.currentRole;
    widget.state.addListener(_onStateChange);
  }

  @override
  void dispose() {
    widget.state.removeListener(_onStateChange);
    super.dispose();
  }

  void _onStateChange() {
    if (!mounted) return;
    if (_lastRole != widget.state.currentRole) {
      setState(() {
        _lastRole = widget.state.currentRole;
        _currentIndex = 0; // Reset tab on role switch
      });
    } else {
      setState(() {});
    }
  }

  String _getRoleLabel(UserRole role) {
    switch (role) {
      case UserRole.resident:
        return 'Resident';
      case UserRole.guard:
        return 'Security Guard';
      case UserRole.chairman:
        return 'Society Admin';
      case UserRole.committee:
        return 'Committee';
      case UserRole.accountant:
        return 'Accountant';
      case UserRole.admin:
        return 'SaaS Admin';
    }
  }

  Widget _buildBodyForRole(UserRole role) {
    switch (role) {
      case UserRole.resident:
        switch (_currentIndex) {
          case 0:
            return ResidentDashboard(state: widget.state);
          case 1:
            return DocumentVaultScreen(state: widget.state);
          case 2:
            return PollingScreen(state: widget.state);
          case 3:
            return AmenityBookingScreen(state: widget.state);
          default:
            return ResidentDashboard(state: widget.state);
        }

      case UserRole.chairman:
      case UserRole.committee:
        switch (_currentIndex) {
          case 0:
            return ChairmanDashboard(state: widget.state);
          case 1:
            return SocietySetupWizardScreen(state: widget.state);
          case 2:
            return DocumentVaultScreen(state: widget.state);
          case 3:
            return PollingScreen(state: widget.state);
          case 4:
            return AuditTrailScreen(state: widget.state);
          default:
            return ChairmanDashboard(state: widget.state);
        }

      case UserRole.guard:
        return GuardDashboard(state: widget.state);

      case UserRole.accountant:
        return AccountantDashboard(state: widget.state);

      case UserRole.admin:
        switch (_currentIndex) {
          case 0:
            return SaasAdminDashboard(state: widget.state);
          case 1:
            return SuperAdminPortalScreen(state: widget.state);
          case 2:
            return SocietySetupWizardScreen(state: widget.state);
          default:
            return SaasAdminDashboard(state: widget.state);
        }
    }
  }

  List<BottomNavigationBarItem> _getNavItemsForRole(UserRole role) {
    switch (role) {
      case UserRole.resident:
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.folder_shared_outlined), label: 'Vault'),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_vote_outlined), label: 'Polling'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_tennis_rounded), label: 'Amenities'),
        ];

      case UserRole.chairman:
      case UserRole.committee:
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Overview'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_suggest_rounded), label: 'Setup'),
          BottomNavigationBarItem(icon: Icon(Icons.folder_shared_outlined), label: 'Vault'),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_vote_outlined), label: 'Polling'),
          BottomNavigationBarItem(icon: Icon(Icons.security_update_good_rounded), label: 'Audit'),
        ];

      case UserRole.guard:
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.security_rounded), label: 'Gate Console'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_rounded), label: 'Pass Scanner'),
          BottomNavigationBarItem(icon: Icon(Icons.history_rounded), label: 'Daily Log'),
        ];

      case UserRole.accountant:
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_rounded), label: 'Accounting'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_rounded), label: 'Bills & Dues'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Ledger'),
        ];

      case UserRole.admin:
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize_rounded), label: 'SaaS Overview'),
          BottomNavigationBarItem(icon: Icon(Icons.business_center_rounded), label: 'Subscriptions'),
          BottomNavigationBarItem(icon: Icon(Icons.add_business_rounded), label: 'Onboard Society'),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isWide = context.isWide;
    final navItems = _getNavItemsForRole(state.currentRole);

    final safeIndex = _currentIndex < navItems.length ? _currentIndex : 0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: AppSpacing.lg,
        backgroundColor: isDark ? AppColors.surfaceDark : AppColors.primaryNavy,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              state.currentRole == UserRole.admin
                  ? 'SaaS Super Admin Platform'
                  : (state.societyName.isNotEmpty ? state.societyName : 'Housing Society'),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(Icons.circle, size: 7, color: AppColors.success),
                AppSpacing.hGapXs,
                Expanded(
                  child: Text(
                    state.currentRole == UserRole.admin
                        ? 'Global Multi-Tenant SaaS'
                        : '${state.currentSociety?.code != null && state.currentSociety!.code.isNotEmpty ? "Reg: ${state.currentSociety!.code} • " : ""}${state.currentUserName.isNotEmpty ? "${state.currentUserName} (${_getRoleLabel(state.currentRole)})" : _getRoleLabel(state.currentRole)}',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          // Active Emergency SOS Siren Icon (if active emergency in society)
          if (state.activeSosAlerts.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: IconButton(
                tooltip: 'Emergency SOS Alert Active!',
                icon: const Icon(
                  Icons.emergency_rounded,
                  color: Colors.amberAccent,
                  size: 26,
                ),
                onPressed: () => showUserManagementSheet(context, state),
              ),
            ),

          // User Profile & Persona Switcher Avatar
          Padding(
            padding: const EdgeInsets.only(right: 14, left: 4),
            child: InkWell(
              onTap: () => showUserManagementSheet(context, state),
              borderRadius: AppRadii.borderFull,
              child: AppAvatar(
                name: state.currentUserName,
                radius: 18,
                hasBorder: true,
                backgroundColor: AppColors.accentTeal,
              ),
            ),
          ),
        ],
      ),
      body: isWide
          ? Row(
              children: [
                NavigationRail(
                  selectedIndex: safeIndex,
                  onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
                  labelType: NavigationRailLabelType.all,
                  backgroundColor: isDark ? AppColors.surfaceDark : Colors.white,
                  selectedIconTheme: const IconThemeData(color: AppColors.accentTeal),
                  selectedLabelTextStyle: const TextStyle(
                    color: AppColors.accentTeal,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  unselectedLabelTextStyle: TextStyle(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    fontSize: 11,
                  ),
                  destinations: navItems
                      .map(
                        (item) => NavigationRailDestination(
                          icon: item.icon,
                          selectedIcon: item.activeIcon,
                          label: Text(item.label ?? ''),
                        ),
                      )
                      .toList(),
                ),
                VerticalDivider(
                  thickness: 1,
                  width: 1,
                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                ),
                Expanded(
                  child: ResponsiveContainer(
                    child: _buildBodyForRole(state.currentRole),
                  ),
                ),
              ],
            )
          : _buildBodyForRole(state.currentRole),
      bottomNavigationBar: isWide
          ? null
          : BottomNavigationBar(
              currentIndex: safeIndex,
              onTap: (idx) => setState(() => _currentIndex = idx),
              items: navItems,
            ),
    );
  }
}
