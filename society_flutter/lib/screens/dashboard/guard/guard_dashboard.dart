import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';
import 'modals/guard_new_visitor_modal.dart';
import 'widgets/guard_occupancy_stats.dart';
import 'widgets/guard_passcode_verifier.dart';
import 'widgets/guard_sos_banner.dart';
import 'widgets/guard_visitor_card.dart';

/// Redesigned Security Guard Console (<220 lines)
class GuardDashboard extends StatefulWidget {
  final SocietyState state;
  const GuardDashboard({super.key, required this.state});

  @override
  State<GuardDashboard> createState() => _GuardDashboardState();
}

class _GuardDashboardState extends State<GuardDashboard> {
  int _selectedTab = 0; // 0: All, 1: Inside, 2: Waiting Approval, 3: Exited

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final allVisitors = state.visitors;

    final filteredVisitors = allVisitors.where((v) {
      if (_selectedTab == 1) return v.status == VisitorStatus.inside;
      if (_selectedTab == 2) return v.status == VisitorStatus.waitingApproval;
      if (_selectedTab == 3) return v.status == VisitorStatus.exited;
      return true;
    }).toList();

    return RefreshIndicator(
      onRefresh: () => state.fetchInitialData(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: AppSpacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Emergency Siren Alert Banner (if active)
            GuardSosBanner(state: state),

            // 2. Gate Status Card
            Container(
              padding: AppSpacing.insetAllMd,
              decoration: BoxDecoration(
                color: isDark ? AppColors.surfaceElevatedDark : AppColors.primaryNavy,
                borderRadius: AppRadii.borderLg,
              ),
              child: Row(
                children: [
                  const AppAvatar(
                    name: 'G1',
                    radius: 20,
                    backgroundColor: Colors.white24,
                    foregroundColor: Colors.white,
                  ),
                  AppSpacing.hGapMd,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Main Security Gate 1',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          'Duty Guard: ${state.currentUserName}',
                          style: const TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.success,
                      borderRadius: AppRadii.borderSm,
                    ),
                    child: const Text(
                      'GATE ACTIVE',
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.vGapLg,

            // 3. Instant 4-Digit Passcode Verifier Card
            GuardPasscodeVerifier(state: state),
            AppSpacing.vGapLg,

            // 4. Live Occupancy & Quick Action
            GuardOccupancyStats(
              state: state,
              onNewVisitor: () => showGuardNewVisitorModal(context, state),
            ),
            AppSpacing.vGapXl,

            // 5. Visitor Filter Tabs
            AppSectionHeader(
              title: 'Visitor Log (${filteredVisitors.length})',
              padding: EdgeInsets.zero,
            ),
            AppSpacing.vGapSm,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTab(0, 'All (${allVisitors.length})'),
                  AppSpacing.hGapXs,
                  _buildTab(1, 'Inside (${allVisitors.where((v) => v.status == VisitorStatus.inside).length})'),
                  AppSpacing.hGapXs,
                  _buildTab(2, 'Waiting (${allVisitors.where((v) => v.status == VisitorStatus.waitingApproval).length})'),
                  AppSpacing.hGapXs,
                  _buildTab(3, 'Exited (${allVisitors.where((v) => v.status == VisitorStatus.exited).length})'),
                ],
              ),
            ),
            AppSpacing.vGapMd,

            // 6. Visitor List
            if (filteredVisitors.isEmpty)
              const AppEmptyState(
                icon: Icons.shield_outlined,
                title: 'No Visitors in Category',
                message: 'No entries currently match this filter.',
              )
            else
              ...filteredVisitors.map((v) => GuardVisitorCard(entry: v, state: state)),
            AppSpacing.vGapXl,
          ],
        ),
      ),
    );
  }

  Widget _buildTab(int index, String label) {
    final isSelected = _selectedTab == index;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: AppColors.primaryContainer,
      labelStyle: TextStyle(
        color: isSelected ? AppColors.primaryNavy : AppColors.textSecondary(context),
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        fontSize: 12,
      ),
      onSelected: (val) {
        if (val) setState(() => _selectedTab = index);
      },
    );
  }
}
