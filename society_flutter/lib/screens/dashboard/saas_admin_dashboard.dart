import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../../services/society_state.dart';
import '../saas/super_admin_portal_screen.dart';
import '../saas/widgets/saas_metrics_grid.dart';
import '../saas/widgets/saas_subscription_card.dart';
import '../saas/modals/onboard_society_sheet.dart';

class SaasAdminDashboard extends StatelessWidget {
  final SocietyState state;
  const SaasAdminDashboard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final metrics = state.saasMetrics;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return RefreshIndicator(
      onRefresh: () => state.loadSocieties(),
      child: SingleChildScrollView(
        padding: AppSpacing.screenPadding,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Platform Header Banner
            Container(
              padding: AppSpacing.insetAllMd,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF312E81), Color(0xFF4338CA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: AppRadii.borderLg,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    child: const Icon(Icons.cloud_done_rounded, color: Colors.white, size: 26),
                  ),
                  AppSpacing.hGapMd,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SaaS Platform Super Admin',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AppSpacing.vGapXs,
                        Text(
                          'Multi-Tenant Licensing & Automated Billing',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.85),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: AppRadii.borderFull,
                    ),
                    child: const Text(
                      'Super Admin',
                      style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.vGapLg,

            // Business KPI Grid
            SaasMetricsGrid(metrics: metrics),
            AppSpacing.vGapLg,

            // Action Buttons: Onboard Society & Open Super Admin Hub
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AppButton(
                    label: 'Onboard Society',
                    icon: Icons.domain_add_rounded,
                    variant: AppButtonVariant.primary,
                    onPressed: () => OnboardSocietySheet.show(context, state),
                  ),
                ),
                AppSpacing.hGapSm,
                Expanded(
                  flex: 4,
                  child: AppButton(
                    label: 'Super Admin Portal',
                    icon: Icons.hub_outlined,
                    variant: AppButtonVariant.outline,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => SuperAdminPortalScreen(state: state),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            AppSpacing.vGapLg,

            // Pricing Plans Quick Card
            AppCard(
              color: isDark ? AppColors.surfaceElevatedDark : const Color(0xFFF8FAFC),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSectionHeader(
                    title: 'Active SaaS Subscription Tiers',
                    subtitle: 'Automated per-flat monthly subscription quotas',
                  ),
                  AppSpacing.vGapSm,
                  Row(
                    children: [
                      Expanded(
                        child: _buildTierBox(
                          tier: 'Starter',
                          rate: '₹15',
                          desc: 'Gate & Maintenance',
                          color: AppColors.info,
                          isDark: isDark,
                        ),
                      ),
                      AppSpacing.hGapXs,
                      Expanded(
                        child: _buildTierBox(
                          tier: 'Pro',
                          rate: '₹25',
                          desc: 'Full Accounting + Passes',
                          color: AppColors.accentTeal,
                          isDark: isDark,
                        ),
                      ),
                      AppSpacing.hGapXs,
                      Expanded(
                        child: _buildTierBox(
                          tier: 'Enterprise',
                          rate: '₹35',
                          desc: 'Shared Multi-Complex',
                          color: AppColors.primaryNavy,
                          isDark: isDark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppSpacing.vGapLg,

            // Client Societies Table/List
            AppSectionHeader(
              title: 'Client Societies & Subscriptions',
              subtitle: '${state.subscriptions.length} registered housing communities',
              actionLabel: 'View All',
              onAction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => SuperAdminPortalScreen(state: state),
                  ),
                );
              },
            ),
            AppSpacing.vGapSm,

            if (state.subscriptions.isEmpty)
              const AppEmptyState(
                icon: Icons.receipt_long_rounded,
                title: 'No client societies found',
                message: 'Provision a housing society above to activate subscription billing.',
              )
            else
              ...state.subscriptions.take(5).map(
                    (sub) => SaasSubscriptionCard(subscription: sub),
                  ),
            AppSpacing.vGapXl,
          ],
        ),
      ),
    );
  }

  Widget _buildTierBox({
    required String tier,
    required String rate,
    required String desc,
    required Color color,
    required bool isDark,
  }) {
    return Container(
      padding: AppSpacing.insetAllSm,
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: AppRadii.borderSm,
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tier,
            style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 13),
          ),
          AppSpacing.vGapXs,
          Text(
            '$rate /flat/mo',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          AppSpacing.vGapXs,
          Text(
            desc,
            style: TextStyle(
              color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
              fontSize: 10,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
