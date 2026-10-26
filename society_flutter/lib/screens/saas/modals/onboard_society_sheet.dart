import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../../../services/society_state.dart';

class OnboardSocietySheet extends StatefulWidget {
  final SocietyState state;

  const OnboardSocietySheet({super.key, required this.state});

  static Future<void> show(BuildContext context, SocietyState state) {
    return AppBottomSheet.show<void>(
      context: context,
      title: 'Onboard New Society',
      child: OnboardSocietySheet(state: state),
    );
  }

  @override
  State<OnboardSocietySheet> createState() => _OnboardSocietySheetState();
}

class _OnboardSocietySheetState extends State<OnboardSocietySheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _codeCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _cityCtrl = TextEditingController(text: 'Pune');
  final _stateCtrl = TextEditingController(text: 'Maharashtra');
  final _pincodeCtrl = TextEditingController(text: '411038');
  final _flatsCtrl = TextEditingController(text: '120');
  final _adminNameCtrl = TextEditingController();
  final _adminPhoneCtrl = TextEditingController();
  final _adminEmailCtrl = TextEditingController();

  String _selectedPlan = 'Pro / Standard (Up to 200 Flats)';
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _codeCtrl.dispose();
    _addressCtrl.dispose();
    _cityCtrl.dispose();
    _stateCtrl.dispose();
    _pincodeCtrl.dispose();
    _flatsCtrl.dispose();
    _adminNameCtrl.dispose();
    _adminPhoneCtrl.dispose();
    _adminEmailCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final soc = await widget.state.onboardNewSociety(
        name: _nameCtrl.text.trim(),
        code: _codeCtrl.text.trim().toUpperCase(),
        address: _addressCtrl.text.trim(),
        city: _cityCtrl.text.trim(),
        stateName: _stateCtrl.text.trim(),
        pincode: _pincodeCtrl.text.trim(),
        totalFlats: int.tryParse(_flatsCtrl.text.trim()) ?? 100,
        planName: _selectedPlan,
        adminName: _adminNameCtrl.text.trim(),
        adminPhone: _adminPhoneCtrl.text.trim(),
        adminEmail: _adminEmailCtrl.text.trim(),
      );

      if (mounted) {
        setState(() => _isSubmitting = false);
        if (soc != null) {
          Navigator.of(context).pop();
          AppSnackbar.showSuccess(
            context,
            'Society "${soc.name}" successfully onboarded and activated!',
          );
        } else {
          AppSnackbar.showError(
            context,
            'Failed to onboard society. Please check your inputs.',
          );
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSubmitting = false);
        AppSnackbar.showError(context, 'Error onboarding society: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.xl,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeader(
              title: '1. Society Information',
              subtitle: 'Basic details for multi-tenant isolation',
            ),
            AppSpacing.vGapSm,
            AppTextField(
              controller: _nameCtrl,
              label: 'Society Full Name',
              hint: 'e.g. Greenwoods Co-op Housing Society',
              prefixIcon: const Icon(Icons.apartment_rounded),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Society name required' : null,
            ),
            AppSpacing.vGapSm,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppTextField(
                    controller: _codeCtrl,
                    label: 'Code',
                    hint: 'GWH',
                    textCapitalization: TextCapitalization.characters,
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Code required' : null,
                  ),
                ),
                AppSpacing.hGapSm,
                Expanded(
                  flex: 3,
                  child: AppTextField(
                    controller: _flatsCtrl,
                    label: 'Total Flats',
                    hint: '120',
                    keyboardType: TextInputType.number,
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Flats required' : null,
                  ),
                ),
              ],
            ),
            AppSpacing.vGapSm,
            AppTextField(
              controller: _addressCtrl,
              label: 'Street Address',
              hint: 'e.g. Plot 45, Kothrud',
              prefixIcon: const Icon(Icons.place_outlined),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Address required' : null,
            ),
            AppSpacing.vGapSm,
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    controller: _cityCtrl,
                    label: 'City',
                  ),
                ),
                AppSpacing.hGapSm,
                Expanded(
                  child: AppTextField(
                    controller: _stateCtrl,
                    label: 'State',
                  ),
                ),
                AppSpacing.hGapSm,
                Expanded(
                  child: AppTextField(
                    controller: _pincodeCtrl,
                    label: 'Pincode',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            AppSpacing.vGapMd,
            const AppSectionHeader(
              title: '2. Subscription Tier',
              subtitle: 'Recurring billing plan and feature unlocks',
            ),
            AppSpacing.vGapSm,
            DropdownButtonFormField<String>(
              initialValue: _selectedPlan,
              decoration: InputDecoration(
                filled: true,
                fillColor: isDark ? AppColors.surfaceElevatedDark : AppColors.surfaceLight,
                contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                border: OutlineInputBorder(
                  borderRadius: AppRadii.borderMd,
                  borderSide: BorderSide(
                    color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  ),
                ),
              ),
              dropdownColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
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
                if (val != null) setState(() => _selectedPlan = val);
              },
            ),
            AppSpacing.vGapMd,
            const AppSectionHeader(
              title: '3. Primary Administrator',
              subtitle: 'Initial Chairman / Manager account credential',
            ),
            AppSpacing.vGapSm,
            AppTextField(
              controller: _adminNameCtrl,
              label: 'Admin Full Name',
              hint: 'e.g. Rajesh Deshmukh',
              prefixIcon: const Icon(Icons.person_outline),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Admin name required' : null,
            ),
            AppSpacing.vGapSm,
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    controller: _adminPhoneCtrl,
                    label: 'Admin Mobile',
                    hint: '9822334455',
                    prefixIcon: const Icon(Icons.phone_outlined),
                    keyboardType: TextInputType.phone,
                    validator: (v) => (v == null || v.trim().length < 8) ? 'Valid phone required' : null,
                  ),
                ),
                AppSpacing.hGapSm,
                Expanded(
                  child: AppTextField(
                    controller: _adminEmailCtrl,
                    label: 'Admin Email',
                    hint: 'admin@greenwoods.in',
                    prefixIcon: const Icon(Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) => (v == null || !v.contains('@')) ? 'Valid email required' : null,
                  ),
                ),
              ],
            ),
            AppSpacing.vGapLg,
            AppButton(
              label: 'Provision & Activate Society Account',
              icon: Icons.check_circle_outline_rounded,
              isFullWidth: true,
              isLoading: _isSubmitting,
              onPressed: _handleSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
