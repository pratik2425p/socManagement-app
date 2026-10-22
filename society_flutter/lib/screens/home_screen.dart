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

  @override
  Widget build(BuildContext context) {
    final state = widget.state;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.currentRole == UserRole.admin
                  ? 'SaaS Super Admin Platform'
                  : state.societyName,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Icon(Icons.circle, size: 8, color: AppTheme.successGreen),
                const SizedBox(width: 4),
                Text(
                  state.currentRole == UserRole.admin
                      ? 'Global Cloud Multi-Tenant Engine'
                      : 'Connected to Serverpod Cloud',
                  style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.8)),
                ),
              ],
            ),
          ],
        ),
        actions: [
          // Quick shortcuts to Polling & Documents
          IconButton(
            tooltip: 'Democratic Polling & Voting',
            icon: const Icon(Icons.how_to_vote_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => PollingScreen(state: state),
                ),
              );
            },
          ),
          IconButton(
            tooltip: 'Document Vault & AGM Minutes',
            icon: const Icon(Icons.folder_shared_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => DocumentVaultScreen(state: state),
                ),
              );
            },
          ),
          // Active User Profile & Fresh User Switcher Pill
          InkWell(
            onTap: () => showUserManagementSheet(context, state),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.22),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 11,
                    backgroundColor: AppTheme.accentTeal,
                    child: Text(
                      state.currentUserName.isNotEmpty ? state.currentUserName[0].toUpperCase() : 'U',
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 4),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 55),
                    child: Text(
                      state.currentUserName.split(' ').first,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.white, size: 16),
                ],
              ),
            ),
          ),
          // Role Switcher Dropdown in App Bar
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<UserRole>(
                value: state.currentRole,
                dropdownColor: AppTheme.primaryNavy,
                icon: const Icon(Icons.swap_horiz, color: Colors.white, size: 18),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                items: const [
                  DropdownMenuItem(
                    value: UserRole.resident,
                    child: Text('🏠 Resident (Flat Owner)'),
                  ),
                  DropdownMenuItem(
                    value: UserRole.guard,
                    child: Text('🛡️ Security Guard'),
                  ),
                  DropdownMenuItem(
                    value: UserRole.chairman,
                    child: Text('🏛️ Chairman / Committee'),
                  ),
                  DropdownMenuItem(
                    value: UserRole.accountant,
                    child: Text('📊 Accountant (Ledger)'),
                  ),
                  DropdownMenuItem(
                    value: UserRole.admin,
                    child: Text('🌐 SaaS Super Admin'),
                  ),
                ],
                onChanged: (role) {
                  if (role != null) {
                    state.setRole(role);
                    setState(() {
                      _currentIndex = 0;
                    });
                  }
                },
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
        onTap: (idx) => setState(() => _currentIndex = idx),
        selectedItemColor: AppTheme.primaryNavy,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Overview'),
          BottomNavigationBarItem(icon: Icon(Icons.approval), label: 'Approvals'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Members'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
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
