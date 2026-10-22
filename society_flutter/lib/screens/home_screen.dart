import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../services/society_state.dart';
import '../theme/app_theme.dart';
import 'dashboard/resident_dashboard.dart';
import 'dashboard/guard_dashboard.dart';
import 'dashboard/chairman_dashboard.dart';
import 'dashboard/accountant_dashboard.dart';

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
              state.societyName,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Icon(Icons.circle, size: 8, color: AppTheme.successGreen),
                const SizedBox(width: 4),
                Text(
                  'Connected to Serverpod Cloud',
                  style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.8)),
                ),
              ],
            ),
          ],
        ),
        actions: [
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
      default:
        return ResidentDashboard(state: widget.state);
    }
  }

  Widget _buildBottomNav() {
    final role = widget.state.currentRole;

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
      onTap: (idx) => setState(() => _currentIndex = idx),
      selectedItemColor: AppTheme.primaryNavy,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'Gate Passes'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Maintenance'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Helpdesk'),
      ],
    );
  }
}
