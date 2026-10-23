import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../services/society_state.dart';
import '../theme/app_theme.dart';
import 'dashboard/resident_dashboard.dart';
import 'dashboard/guard_dashboard.dart';
import 'dashboard/chairman_dashboard.dart';
import 'dashboard/accountant_dashboard.dart';
import 'dashboard/saas_admin_dashboard.dart';
import 'documents/document_vault_screen.dart';
import 'polling/polling_screen.dart';
import 'profile/user_management_sheet.dart';
import 'onboarding/society_setup_wizard_screen.dart';

class HomeScreen extends StatefulWidget {
  final SocietyState state;
  const HomeScreen({super.key, required this.state});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

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

  String _getRoleLabel(UserRole role) {
    switch (role) {
      case UserRole.resident:
        return 'Resident';
      case UserRole.guard:
        return 'Security Guard';
      case UserRole.chairman:
        return 'Society Admin';
      case UserRole.committee:
        return 'Committee Member';
      case UserRole.accountant:
        return 'Accountant';
      case UserRole.admin:
        return 'SaaS Admin';
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 16,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              state.currentRole == UserRole.admin
                  ? 'SaaS Super Admin Platform'
                  : (state.societyName.isNotEmpty ? state.societyName : 'Housing Society'),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(Icons.circle, size: 7, color: AppTheme.successGreen),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    state.currentRole == UserRole.admin
                        ? 'Global SaaS Platform'
                        : '${state.currentSociety?.code != null && state.currentSociety!.code.isNotEmpty ? "Reg: ${state.currentSociety!.code} • " : ""}${state.currentUserName.isNotEmpty ? "${state.currentUserName} (${_getRoleLabel(state.currentRole)})" : _getRoleLabel(state.currentRole)}',
                    style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.85)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          // Emergency SOS Indicator (if active emergency in society)
          if (state.activeSosAlerts.isNotEmpty)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                tooltip: 'Emergency SOS Alert Active',
                icon: const Icon(Icons.emergency_rounded, color: Colors.amberAccent, size: 24),
                onPressed: () {
                  // Direct to active SOS alert
                },
              ),
            ),

          // User Profile & Roles Avatar Button
          Padding(
            padding: const EdgeInsets.only(right: 14, left: 6),
            child: InkWell(
              onTap: () => showUserManagementSheet(context, state),
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withValues(alpha: 0.5), width: 1.5),
                ),
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppTheme.accentTeal,
                  child: Text(
                    state.currentUserName.isNotEmpty ? state.currentUserName[0].toUpperCase() : 'U',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: _buildCurrentDashboard(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildCurrentDashboard() {
    switch (widget.state.currentRole) {
      case UserRole.resident:
        return ResidentDashboard(state: widget.state);
      case UserRole.guard:
        return GuardDashboard(state: widget.state);
      case UserRole.chairman:
      case UserRole.committee:
        return ChairmanDashboard(state: widget.state);
      case UserRole.accountant:
        return AccountantDashboard(state: widget.state);
      case UserRole.admin:
        return SaasAdminDashboard(state: widget.state);
    }
  }

  Widget _buildBottomNav() {
    final role = widget.state.currentRole;

    if (role == UserRole.admin) {
      return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (idx) => setState(() => _currentIndex = idx),
        selectedItemColor: const Color(0xFF4338CA),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize), label: 'SaaS Overview'),
          BottomNavigationBarItem(icon: Icon(Icons.business_center), label: 'Subscriptions'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Revenue & Billing'),
        ],
      );
    }

    if (role == UserRole.guard) {
      return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (idx) => setState(() => _currentIndex = idx),
        selectedItemColor: AppTheme.primaryNavy,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.security), label: 'Gate Entry'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Pass Scanner'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Daily Log'),
        ],
      );
    }

    if (role == UserRole.accountant) {
      return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (idx) => setState(() => _currentIndex = idx),
        selectedItemColor: AppTheme.accentTeal,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'Accounting'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Bills & Dues'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
        ],
      );
    }

    if (role == UserRole.chairman) {
      return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (idx) {
          if (idx == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => SocietySetupWizardScreen(state: widget.state)),
            );
          } else if (idx == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => DocumentVaultScreen(state: widget.state)),
            );
          } else if (idx == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => PollingScreen(state: widget.state)),
            );
          } else {
            setState(() => _currentIndex = idx);
          }
        },
        selectedItemColor: AppTheme.primaryNavy,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_suggest_rounded), label: 'Setup Wizard'),
          BottomNavigationBarItem(icon: Icon(Icons.folder_shared_outlined), label: 'Doc Vault'),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_vote_outlined), label: 'Polling'),
        ],
      );
    }

    // Default Resident Nav
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (idx) {
        if (idx == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => DocumentVaultScreen(state: widget.state)),
          );
        } else if (idx == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => PollingScreen(state: widget.state)),
          );
        } else {
          setState(() => _currentIndex = idx);
        }
      },
      selectedItemColor: AppTheme.primaryNavy,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.folder_shared_outlined), label: 'Doc Vault'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Maintenance'),
        BottomNavigationBarItem(icon: Icon(Icons.how_to_vote_outlined), label: 'Polling'),
      ],
    );
  }
}
