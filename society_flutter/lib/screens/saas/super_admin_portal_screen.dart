import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../services/society_state.dart';
import '../../theme/app_theme.dart';
import '../onboarding/society_setup_wizard_screen.dart';

class SuperAdminPortalScreen extends StatefulWidget {
  final SocietyState state;
  const SuperAdminPortalScreen({super.key, required this.state});

  @override
  State<SuperAdminPortalScreen> createState() => _SuperAdminPortalScreenState();
}

class _SuperAdminPortalScreenState extends State<SuperAdminPortalScreen> with SingleTickerProviderStateMixin {
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

  void _showOnboardSocietyDialog() {
    final formKey = GlobalKey<FormState>();
    final nameCtrl = TextEditingController();
    final codeCtrl = TextEditingController();
    final addressCtrl = TextEditingController();
    final cityCtrl = TextEditingController(text: 'Pune');
    final stateCtrl = TextEditingController(text: 'Maharashtra');
    final pincodeCtrl = TextEditingController(text: '411038');
    final flatsCtrl = TextEditingController(text: '120');
    final adminNameCtrl = TextEditingController();
    final adminPhoneCtrl = TextEditingController();
    final adminEmailCtrl = TextEditingController();

    String selectedPlan = 'Pro / Standard (Up to 200 Flats)';
    bool isSubmitting = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) => Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 8),
                width: 48,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4338CA).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.add_business_rounded, color: Color(0xFF4338CA), size: 24),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Onboard New Customer Society',
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppTheme.darkSlate),
                          ),
                          Text(
                            'Creates Society, Subscription & Primary Admin in PostgreSQL',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(ctx),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '1. Society Information',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.darkSlate),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: nameCtrl,
                          decoration: InputDecoration(
                            labelText: 'Society Full Name *',
                            hintText: 'e.g. Greenwoods Co-op Housing Society',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (v) => (v == null || v.trim().isEmpty) ? 'Society name required' : null,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: codeCtrl,
                                textCapitalization: TextCapitalization.characters,
                                decoration: InputDecoration(
                                  labelText: 'Society Code *',
                                  hintText: 'e.g. GWH',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                validator: (v) => (v == null || v.trim().isEmpty) ? 'Code required' : null,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                controller: flatsCtrl,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Total Flats *',
                                  hintText: 'e.g. 120',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                validator: (v) => (v == null || v.trim().isEmpty) ? 'Total flats required' : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: addressCtrl,
                          decoration: InputDecoration(
                            labelText: 'Address *',
                            hintText: 'e.g. Plot 45, Kothrud',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (v) => (v == null || v.trim().isEmpty) ? 'Address required' : null,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: cityCtrl,
                                decoration: InputDecoration(
                                  labelText: 'City *',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller: stateCtrl,
                                decoration: InputDecoration(
                                  labelText: 'State *',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller: pincodeCtrl,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Pincode *',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        const Text(
                          '2. Subscription Plan Tier',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.darkSlate),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          initialValue: selectedPlan,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'Starter (Up to 50 Flats)',
                              child: Text('Starter - ₹2,500/mo (Up to 50 Flats)'),
                            ),
                            DropdownMenuItem(
                              value: 'Pro / Standard (Up to 200 Flats)',
                              child: Text('Pro / Standard - ₹5,000/mo (Up to 200 Flats)'),
                            ),
                            DropdownMenuItem(
                              value: 'Enterprise / Large (Unlimited)',
                              child: Text('Enterprise - ₹12,000/mo (Unlimited Flats)'),
                            ),
                          ],
                          onChanged: (val) {
                            if (val != null) setModalState(() => selectedPlan = val);
                          },
                        ),
                        const SizedBox(height: 20),

                        const Text(
                          '3. Primary Society Administrator (Chairman)',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.darkSlate),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: adminNameCtrl,
                          decoration: InputDecoration(
                            labelText: 'Admin Full Name *',
                            hintText: 'e.g. Rajesh Deshmukh',
                            prefixIcon: const Icon(Icons.person_outline),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (v) => (v == null || v.trim().isEmpty) ? 'Admin name required' : null,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: adminPhoneCtrl,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: 'Admin Mobile *',
                                  hintText: 'e.g. 9822334455',
                                  prefixIcon: const Icon(Icons.phone_outlined),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                validator: (v) => (v == null || v.trim().length < 8) ? 'Valid phone required' : null,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                controller: adminEmailCtrl,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Admin Email *',
                                  hintText: 'e.g. admin@greenwoods.in',
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                validator: (v) => (v == null || !v.contains('@')) ? 'Valid email required' : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: isSubmitting
                                ? null
                                : () async {
                                    if (!formKey.currentState!.validate()) return;
                                    setModalState(() => isSubmitting = true);

                                    final soc = await widget.state.onboardNewSociety(
                                      name: nameCtrl.text.trim(),
                                      code: codeCtrl.text.trim(),
                                      address: addressCtrl.text.trim(),
                                      city: cityCtrl.text.trim(),
                                      stateName: stateCtrl.text.trim(),
                                      pincode: pincodeCtrl.text.trim(),
                                      totalFlats: int.tryParse(flatsCtrl.text.trim()) ?? 100,
                                      planName: selectedPlan,
                                      adminName: adminNameCtrl.text.trim(),
                                      adminPhone: adminPhoneCtrl.text.trim(),
                                      adminEmail: adminEmailCtrl.text.trim(),
                                    );

                                    if (soc != null) {
                                      if (ctx.mounted) Navigator.pop(ctx);
                                      if (mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('🎉 Society "${soc.name}" successfully onboarded!'),
                                            backgroundColor: AppTheme.successGreen,
                                            behavior: SnackBarBehavior.floating,
                                          ),
                                        );
                                      }
                                    } else {
                                      setModalState(() => isSubmitting = false);
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4338CA),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: isSubmitting
                                ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                                : const Text(
                                    'Provision & Activate Society Account',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final metrics = state.saasMetrics;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF312E81),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SaaS Super Admin Platform', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Global Multi-Tenant Control Hub', style: TextStyle(fontSize: 11, color: Colors.white70)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              state.loadSocieties();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFF59E0B),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: const [
            Tab(icon: Icon(Icons.apartment_rounded, size: 20), text: 'Societies'),
            Tab(icon: Icon(Icons.bar_chart_rounded, size: 20), text: 'Subscriptions'),
            Tab(icon: Icon(Icons.security_rounded, size: 20), text: 'Multi-Tenant Policy'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSocietiesTab(state),
          _buildSubscriptionsTab(metrics, state),
          _buildPolicyTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showOnboardSocietyDialog,
        backgroundColor: const Color(0xFF4338CA),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Onboard Society', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  Widget _buildSocietiesTab(SocietyState state) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Metric Cards Row
        Row(
          children: [
            Expanded(
              child: _buildMetricTile(
                'Societies',
                '${state.societies.length}',
                Icons.business_rounded,
                const Color(0xFF4338CA),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildMetricTile(
                'Managed Flats',
                '${state.societies.fold(0, (sum, s) => sum + s.totalFlats)}',
                Icons.home_work_rounded,
                const Color(0xFF0D9488),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildMetricTile(
                'Cloud Status',
                'ONLINE',
                Icons.cloud_done_rounded,
                AppTheme.successGreen,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Customer Societies (${state.societies.length})',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.darkSlate),
            ),
            TextButton.icon(
              onPressed: _showOnboardSocietyDialog,
              icon: const Icon(Icons.add, size: 18),
              label: const Text('New Society'),
            ),
          ],
        ),
        const SizedBox(height: 8),

        if (state.societies.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Text('No societies onboarded yet.'),
            ),
          )
        else
          ...state.societies.map((society) {
            final isCurrent = state.currentSocietyId == society.id;

            return Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(color: isCurrent ? const Color(0xFF4338CA) : Colors.grey.shade300, width: isCurrent ? 2 : 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFF4338CA).withValues(alpha: 0.1),
                          child: Text(
                            society.code,
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4338CA)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                society.name,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.darkSlate),
                              ),
                              Text(
                                '${society.address}, ${society.city} - ${society.pincode}',
                                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.successGreen.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            society.subscriptionPlan.split(' ').first.toUpperCase(),
                            style: const TextStyle(color: AppTheme.successGreen, fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Units: ${society.totalFlats} Flats',
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.darkSlate),
                        ),
                        Row(
                          children: [
                            OutlinedButton.icon(
                              onPressed: () {
                                state.switchSociety(society);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => SocietySetupWizardScreen(state: state),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.settings_suggest, size: 16),
                              label: const Text('Setup Wizard', style: TextStyle(fontSize: 12)),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                state.switchSociety(society);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Switched to "${society.name}" workspace'),
                                    backgroundColor: const Color(0xFF4338CA),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isCurrent ? AppTheme.accentTeal : const Color(0xFF4338CA),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                              child: Text(
                                isCurrent ? 'Active Context' : 'Select',
                                style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildMetricTile(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 2),
          Text(title, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
        ],
      ),
    );
  }

  Widget _buildSubscriptionsTab(SaasMetricSummary metrics, SocietyState state) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Revenue Card
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF312E81), Color(0xFF4338CA)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('MONTHLY RECURRING REVENUE (MRR)', style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(
                '₹${metrics.monthlyRecurringRevenue.toStringAsFixed(0)}',
                style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Active subscriptions: ${metrics.activeSubscriptions} • Average Revenue/Society: ₹${metrics.averageRevenuePerSociety.toStringAsFixed(0)}',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        const Text('Active Subscriptions', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppTheme.darkSlate)),
        const SizedBox(height: 10),

        ...state.subscriptions.map((sub) => Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFF4338CA).withValues(alpha: 0.15),
                  child: const Icon(Icons.receipt_long, color: Color(0xFF4338CA)),
                ),
                title: Text(sub.societyName, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Plan: ${sub.tier.name.toUpperCase()} • ${sub.flatCount} Flats @ ₹${sub.ratePerFlat}/mo'),
                trailing: Text(
                  '₹${sub.monthlyTotal.toStringAsFixed(0)}/mo',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.successGreen, fontSize: 15),
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildPolicyTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFF93C5FD)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.verified_user_rounded, color: Color(0xFF2563EB)),
                  SizedBox(width: 8),
                  Text(
                    'Multi-Tenant Data Isolation Architecture',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1E40AF)),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
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
