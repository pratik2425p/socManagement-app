import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../services/society_state.dart';
import '../../theme/app_theme.dart';
import '../saas/super_admin_portal_screen.dart';

class SaasAdminDashboard extends StatelessWidget {
  final SocietyState state;
  const SaasAdminDashboard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final metrics = state.saasMetrics;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Platform Header Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF312E81), Color(0xFF4338CA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.cloud_done, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SaaS Platform Super Admin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Multi-Tenant Licensing & Subscription Billing',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Super Admin',
                    style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Business KPI Grid
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  title: 'Monthly Revenue',
                  value: '₹${metrics.monthlyRecurringRevenue.toInt()}',
                  subtitle: 'MRR (Recurring)',
                  icon: Icons.currency_rupee,
                  color: AppTheme.successGreen,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildMetricCard(
                  title: 'Managed Units',
                  value: '${metrics.totalManagedFlats}',
                  subtitle: 'Total Active Flats',
                  icon: Icons.apartment,
                  color: AppTheme.primaryNavy,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildMetricCard(
                  title: 'Client Societies',
                  value: '${metrics.totalSocieties}',
                  subtitle: '${metrics.trialSocieties} in Free Trial',
                  icon: Icons.business,
                  color: AppTheme.accentTeal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Action Buttons: Onboard Society & Open Super Admin Hub
          Row(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.domain_add),
                    label: const Text(
                      'Onboard Society',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4338CA),
                    ),
                    onPressed: () => _showOnboardDialog(context),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.hub_outlined, color: Color(0xFF4338CA)),
                    label: const Text(
                      'Super Admin Portal',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4338CA)),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF4338CA), width: 1.5),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) => SuperAdminPortalScreen(state: state)),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),

          // Pricing Plans Quick Card
          Card(
            color: const Color(0xFFF8FAFC),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Active SaaS Subscription Tiers',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTierBox(
                          tier: 'Starter',
                          rate: '₹15',
                          desc: 'Basic Gate & Maintenance',
                          color: AppTheme.infoBlue,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildTierBox(
                          tier: 'Pro',
                          rate: '₹25',
                          desc: 'Full Accounting + Passes',
                          color: AppTheme.accentTeal,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildTierBox(
                          tier: 'Enterprise',
                          rate: '₹35',
                          desc: 'Shared Complex + Multi-Gate',
                          color: const Color(0xFF4338CA),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),

          // Client Societies Table/List
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Client Societies & Subscriptions',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${state.subscriptions.length} registered',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10),

          ...state.subscriptions.map((sub) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              sub.societyName,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: sub.status == 'active'
                                  ? AppTheme.successGreen.withValues(alpha: 0.15)
                                  : AppTheme.warningOrange.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              sub.status.toUpperCase(),
                              style: TextStyle(
                                color: sub.status == 'active' ? AppTheme.successGreen : AppTheme.warningOrange,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEF2FF),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Tier: ${sub.tier.name.toUpperCase()}',
                              style: const TextStyle(
                                color: Color(0xFF4338CA),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '•  ${sub.flatCount} Flats @ ₹${sub.ratePerFlat.toInt()}/flat',
                            style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                          ),
                          const Spacer(),
                          Text(
                            '₹${sub.monthlyTotal.toInt()}/mo',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppTheme.primaryNavy,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Contact: ${sub.contactEmail}',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                          ),
                          Text(
                            'Renews: ${sub.nextRenewalDate.day}/${sub.nextRenewalDate.month}/${sub.nextRenewalDate.year}',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
          ),
          Text(
            subtitle,
            style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildTierBox({
    required String tier,
    required String rate,
    required String desc,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tier,
            style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 13),
          ),
          const SizedBox(height: 2),
          Text(
            '$rate /flat/mo',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 2),
          Text(
            desc,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 10),
          ),
        ],
      ),
    );
  }

  void _showOnboardDialog(BuildContext context) {
    final nameCtrl = TextEditingController();
    final flatsCtrl = TextEditingController(text: '40');
    final emailCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    SubscriptionTier tier = SubscriptionTier.pro;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Onboard New Housing Society'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Society Full Name'),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: flatsCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Total Flats'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<SubscriptionTier>(
                        initialValue: tier,
                        decoration: const InputDecoration(labelText: 'Plan Tier'),
                        items: const [
                          DropdownMenuItem(value: SubscriptionTier.starter, child: Text('Starter (₹15)')),
                          DropdownMenuItem(value: SubscriptionTier.pro, child: Text('Pro (₹25)')),
                          DropdownMenuItem(value: SubscriptionTier.enterprise, child: Text('Enterprise (₹35)')),
                        ],
                        onChanged: (val) => setDialogState(() => tier = val!),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(labelText: 'Admin / Committee Email'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: phoneCtrl,
                  decoration: const InputDecoration(labelText: 'Admin Phone Number'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final flats = int.tryParse(flatsCtrl.text) ?? 20;
                if (nameCtrl.text.isNotEmpty) {
                  state.onboardSociety(
                    name: nameCtrl.text,
                    flats: flats,
                    tier: tier,
                    email: emailCtrl.text.isEmpty ? 'admin@society.org' : emailCtrl.text,
                    phone: phoneCtrl.text.isEmpty ? '9800000000' : phoneCtrl.text,
                  );
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppTheme.successGreen,
                      content: Text('Society Onboarded! 14-day free trial activated.'),
                    ),
                  );
                }
              },
              child: const Text('Activate Society'),
            ),
          ],
        ),
      ),
    );
  }
}
