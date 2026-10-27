import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../services/data/demo_data_source.dart';
import '../../services/society_state.dart';
import '../config/app_config.dart';
import '../theme/app_colors.dart';
import '../theme/app_radii.dart';
import '../theme/app_spacing.dart';
import 'app_bottom_sheet.dart';
import 'app_button.dart';
import 'app_section_header.dart';
import 'app_snackbar.dart';

/// Floating/AppBar Demo Ribbon indicating the app is operating in local mock mode.
/// Provides instant access to persona switching and real-time event simulation.
class DemoRibbonBadge extends StatelessWidget {
  final SocietyState state;

  const DemoRibbonBadge({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode || !AppConfig.isDemoMode) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: InkWell(
        onTap: () => showDemoControlModal(context, state),
        borderRadius: AppRadii.borderFull,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
            ),
            borderRadius: AppRadii.borderFull,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.science_rounded, size: 14, color: Colors.white),
              SizedBox(width: 4),
              Text(
                'DEMO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Bottom Sheet providing quick persona switching & event simulation during demos
void showDemoControlModal(BuildContext context, SocietyState state) {
  if (kReleaseMode) return;

  AppBottomSheet.show(
    context: context,
    title: '🧪 Demo Mode Controller',
    subtitle: 'Simulate events & switch personas with zero backend dependencies',
    child: _DemoControlContent(state: state),
  );
}

class _DemoControlContent extends StatelessWidget {
  final SocietyState state;

  const _DemoControlContent({required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppSectionHeader(
          title: 'Quick Persona Switcher',
          subtitle: 'Experience the app from any community role perspective',
          padding: EdgeInsets.zero,
        ),
        AppSpacing.vGapSm,
        _personaTile(
          context,
          role: UserRole.resident,
          name: 'Aarav Mehta',
          sub: 'Flat A-101 • Maintenance Dues & Gate Bell Approvals',
          icon: Icons.home_rounded,
        ),
        _personaTile(
          context,
          role: UserRole.guard,
          name: 'Bahadur Singh',
          sub: 'Security Gate 1 • Walk-in Terminal & SOS Siren Monitor',
          icon: Icons.shield_rounded,
        ),
        _personaTile(
          context,
          role: UserRole.chairman,
          name: 'Vikram Patel',
          sub: 'Flat A-501 • Society KPIs & Expense Voucher Approvals',
          icon: Icons.account_balance_rounded,
        ),
        _personaTile(
          context,
          role: UserRole.accountant,
          name: 'Sneha Deshmukh',
          sub: 'Flat B-202 • Financial Ledger & Voucher Posting',
          icon: Icons.receipt_long_rounded,
        ),
        _personaTile(
          context,
          role: UserRole.admin,
          name: 'Platform Super Admin',
          sub: 'Multi-Tenant SaaS Overview & MRR Analytics',
          icon: Icons.admin_panel_settings_rounded,
        ),
        AppSpacing.vGapLg,
        const AppSectionHeader(
          title: 'Real-Time Event Simulator',
          subtitle: 'Pushes events across foreground streams without a server',
          padding: EdgeInsets.zero,
        ),
        AppSpacing.vGapSm,
        Row(
          children: [
            Expanded(
              child: AppButton.outline(
                label: 'Simulate Visitor',
                icon: Icons.doorbell_rounded,
                height: 42,
                onPressed: () {
                  Navigator.pop(context);
                  if (state.dataSource is DemoDataSource) {
                    (state.dataSource as DemoDataSource).simulateVisitorArrival();
                    AppSnackbar.showSuccess(
                      context,
                      '🔔 Simulated visitor at gate for Flat A-101!',
                    );
                  }
                },
              ),
            ),
            AppSpacing.hGapMd,
            Expanded(
              child: AppButton.destructive(
                label: 'Simulate SOS',
                icon: Icons.emergency_rounded,
                height: 42,
                onPressed: () {
                  Navigator.pop(context);
                  if (state.dataSource is DemoDataSource) {
                    (state.dataSource as DemoDataSource).simulateSosAlert();
                    AppSnackbar.showError(
                      context,
                      '🚨 Simulated Emergency SOS alert triggered!',
                    );
                  }
                },
              ),
            ),
          ],
        ),
        AppSpacing.vGapMd,
      ],
    );
  }

  Widget _personaTile(
    BuildContext context, {
    required UserRole role,
    required String name,
    required String sub,
    required IconData icon,
  }) {
    final isSelected = state.currentRole == role;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: AppRadii.borderMd),
        tileColor: isSelected ? AppColors.primaryContainer.withValues(alpha: 0.4) : null,
        leading: Icon(icon, color: isSelected ? AppColors.primaryNavy : Colors.grey),
        title: Text(name, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.w500)),
        subtitle: Text(sub, style: const TextStyle(fontSize: 11)),
        trailing: isSelected ? const Icon(Icons.check_circle_rounded, color: AppColors.primaryNavy, size: 20) : null,
        onTap: () {
          final matchedUser = state.users.firstWhere(
            (u) => u.role == role,
            orElse: () => SocietyUser(
              societyId: 1,
              fullName: name,
              phone: '9820000000',
              email: 'demo@horizon.in',
              role: role,
              status: 'active',
              createdAt: DateTime.now(),
            ),
          );
          state.setActiveUser(matchedUser);
          Navigator.pop(context);
          AppSnackbar.showSuccess(context, 'Switched to $name (${role.name.toUpperCase()})');
        },
      ),
    );
  }
}
