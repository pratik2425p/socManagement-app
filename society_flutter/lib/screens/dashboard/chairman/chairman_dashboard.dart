import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';
import '../../audit/audit_trail_screen.dart';
import '../../documents/document_vault_screen.dart';
import '../../onboarding/member_invitations_screen.dart';
import '../../onboarding/society_setup_wizard_screen.dart';
import '../../polling/polling_screen.dart';
import 'modals/broadcast_notice_modal.dart';
import 'modals/request_voucher_modal.dart';
import 'widgets/chairman_kpi_grid.dart';
import 'widgets/chairman_voucher_queue.dart';

/// Redesigned Chairman / Society Governance Dashboard with Responsive Web & Mobile Layout
class ChairmanDashboard extends StatelessWidget {
  final SocietyState state;
  const ChairmanDashboard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => state.fetchInitialData(),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        padding: AppSpacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Executive Society KPI Grid (Responsive 4-column desktop, 2-column mobile)
            const AppSectionHeader(
              title: 'Society Executive Overview',
              subtitle: 'Real-time metrics from Serverpod & PostgreSQL',
              padding: EdgeInsets.zero,
            ),
            AppSpacing.vGapSm,
            ChairmanKpiGrid(state: state),
            AppSpacing.vGapLg,

            // 2. Quick Governance Action Buttons
            Row(
              children: [
                Expanded(
                  child: AppButton.secondary(
                    label: 'Broadcast Notice',
                    icon: Icons.campaign_rounded,
                    onPressed: () => showBroadcastNoticeModal(context, state),
                  ),
                ),
                AppSpacing.hGapSm,
                Expanded(
                  child: AppButton.outline(
                    label: 'Raise Voucher',
                    icon: Icons.receipt_rounded,
                    onPressed: () => showRequestVoucherModal(context, state),
                  ),
                ),
              ],
            ),
            AppSpacing.vGapXl,

            // 3. Pending Expense Voucher Review Queue
            const AppSectionHeader(
              title: 'Expense Vouchers Awaiting Approval',
              subtitle: 'Review & approve before posting to Double-Entry Ledger',
            ),
            AppSpacing.vGapSm,
            ChairmanVoucherQueue(state: state),
            AppSpacing.vGapXl,

            // 4. Governance Modules Navigation
            const AppSectionHeader(title: 'Administrative Tools'),
            AppSpacing.vGapSm,
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth >= 700;
                final tiles = [
                  _buildAdminNavTile(
                    context,
                    title: '6-Step Society Onboarding Wizard',
                    subtitle: 'Wings, bulk flat generator, member CSV import',
                    icon: Icons.settings_suggest_rounded,
                    color: AppColors.primaryNavy,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => SocietySetupWizardScreen(state: state)),
                    ),
                  ),
                  _buildAdminNavTile(
                    context,
                    title: 'Member Invitations Engine',
                    subtitle: 'Generate invite codes and track resident onboarding',
                    icon: Icons.mail_outline_rounded,
                    color: AppColors.accentTeal,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => MemberInvitationsScreen(state: state)),
                    ),
                  ),
                  _buildAdminNavTile(
                    context,
                    title: 'Official Document Vault & MOM',
                    subtitle: 'Society bye-laws, audits, AGM minutes, confidential files',
                    icon: Icons.folder_shared_rounded,
                    color: const Color(0xFF059669),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => DocumentVaultScreen(state: state)),
                    ),
                  ),
                  _buildAdminNavTile(
                    context,
                    title: 'Democratic Polling & Resolutions',
                    subtitle: 'Create digital resolutions (1 Flat = 1 Vote)',
                    icon: Icons.how_to_vote_rounded,
                    color: AppColors.info,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => PollingScreen(state: state)),
                    ),
                  ),
                  _buildAdminNavTile(
                    context,
                    title: 'Immutable Compliance Audit Trail',
                    subtitle: 'Chronological log of financial & security events',
                    icon: Icons.security_rounded,
                    color: const Color(0xFF7C3AED),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => AuditTrailScreen(state: state)),
                    ),
                  ),
                ];

                if (!isWide) {
                  return Column(children: tiles);
                }

                final itemWidth = (constraints.maxWidth - AppSpacing.sm) / 2;
                return Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: tiles.map((t) => SizedBox(width: itemWidth, child: t)).toList(),
                );
              },
            ),
            AppSpacing.vGapXxl,
          ],
        ),
      ),
    );
  }

  Widget _buildAdminNavTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return AppCard(
      onTap: onTap,
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: AppRadii.borderSm,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          AppSpacing.hGapMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}
