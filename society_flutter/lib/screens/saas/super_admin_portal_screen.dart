import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../../services/society_state.dart';
import 'widgets/saas_metrics_grid.dart';
import 'widgets/saas_society_card.dart';
import 'widgets/saas_subscription_card.dart';
import 'modals/onboard_society_sheet.dart';

class SuperAdminPortalScreen extends StatefulWidget {
  final SocietyState state;
  const SuperAdminPortalScreen({super.key, required this.state});

  @override
  State<SuperAdminPortalScreen> createState() => _SuperAdminPortalScreenState();
}

class _SuperAdminPortalScreenState extends State<SuperAdminPortalScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    widget.state.loadSocieties();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SaaS Super Admin Platform', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Global Multi-Tenant Control Hub', style: TextStyle(fontSize: 11, color: Colors.white70)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh Platform Data',
            onPressed: () => state.loadSocieties(),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.accentTeal,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: const [
            Tab(icon: Icon(Icons.apartment_rounded, size: 20), text: 'Societies'),
            Tab(icon: Icon(Icons.bar_chart_rounded, size: 20), text: 'Subscriptions'),
            Tab(icon: Icon(Icons.security_rounded, size: 20), text: 'Security Policy'),
          ],
        ),
      ),
      body: ResponsiveContainer(
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildSocietiesTab(state),
            _buildSubscriptionsTab(state),
            _buildPolicyTab(isDark),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => OnboardSocietySheet.show(context, state),
        backgroundColor: AppColors.primaryNavy,
        icon: const Icon(Icons.domain_add_rounded, color: Colors.white),
        label: const Text(
          'Onboard Society',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSocietiesTab(SocietyState state) {
    return RefreshIndicator(
      onRefresh: () => state.loadSocieties(),
      child: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          SaasMetricsGrid(metrics: state.saasMetrics),
          AppSpacing.vGapLg,
          AppSectionHeader(
            title: 'Customer Societies (${state.societies.length})',
            subtitle: 'Isolated multi-tenant instances on Serverpod + PostgreSQL',
            actionLabel: 'Onboard New',
            onAction: () => OnboardSocietySheet.show(context, state),
          ),
          AppSpacing.vGapSm,
          if (state.societies.isEmpty)
            const AppEmptyState(
              icon: Icons.apartment_rounded,
              title: 'No societies onboarded yet',
              message: 'Tap the button below to provision your first customer housing society.',
            )
          else
            ...state.societies.map(
              (society) => SaasSocietyCard(
                society: society,
                isCurrent: state.currentSocietyId == society.id,
                state: state,
              ),
            ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildSubscriptionsTab(SocietyState state) {
    final metrics = state.saasMetrics;

    return RefreshIndicator(
      onRefresh: () => state.loadSocieties(),
      child: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          Container(
            padding: AppSpacing.insetAllLg,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF312E81), Color(0xFF4338CA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: AppRadii.borderLg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MONTHLY RECURRING REVENUE (MRR)',
                  style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                ),
                AppSpacing.vGapXs,
                Text(
                  '₹${metrics.monthlyRecurringRevenue.toStringAsFixed(0)}',
                  style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                AppSpacing.vGapSm,
                Text(
                  'Active Subscriptions: ${metrics.activeSubscriptions} • Average Revenue/Society: ₹${metrics.averageRevenuePerSociety.toStringAsFixed(0)}',
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          AppSpacing.vGapLg,
          AppSectionHeader(
            title: 'Active Society Subscriptions (${state.subscriptions.length})',
            subtitle: 'Automated billing tiers, unit quotas & renewals',
          ),
          AppSpacing.vGapSm,
          if (state.subscriptions.isEmpty)
            const AppEmptyState(
              icon: Icons.receipt_long_rounded,
              title: 'No active subscriptions',
              message: 'Subscriptions will appear once societies complete their trial.',
            )
          else
            ...state.subscriptions.map(
              (sub) => SaasSubscriptionCard(subscription: sub),
            ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildPolicyTab(bool isDark) {
    return ListView(
      padding: AppSpacing.screenPadding,
      children: [
        AppCard(
          color: isDark ? AppColors.surfaceElevatedDark : const Color(0xFFEFF6FF),
          borderColor: const Color(0xFF93C5FD),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.verified_user_rounded, color: Color(0xFF2563EB)),
                  AppSpacing.hGapSm,
                  Expanded(
                    child: Text(
                      'Multi-Tenant Data Isolation Architecture',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1E40AF)),
                    ),
                  ),
                ],
              ),
              AppSpacing.vGapMd,
              const Text(
                '1. Strict Scope Separation: Super Admin provisions customer societies, manages subscriptions, monitors platform health, and assists with onboarding.\n\n'
                '2. Society Autonomy: Daily flat maintenance, resident payments, ledger vouchers, complaints, and security gate visitor entries are strictly isolated to each society_id.\n\n'
                '3. Secure Invitation Principle: Flat Owners do not self-register blindly into unassigned flats. The Society Admin sets up the building directory and dispatches tokenized invitations with OTP verification.',
                style: TextStyle(fontSize: 13, height: 1.5, color: Color(0xFF1E3A8A)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
