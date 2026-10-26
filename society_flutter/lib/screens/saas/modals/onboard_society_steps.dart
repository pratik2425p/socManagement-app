import 'package:flutter/material.dart';
import '../../../core/core.dart';

class OnboardSocietyStep0 extends StatelessWidget {
  final TextEditingController nameCtrl;
  final TextEditingController codeCtrl;
  final TextEditingController flatsCtrl;
  final TextEditingController addressCtrl;
  final TextEditingController cityCtrl;
  final TextEditingController stateCtrl;
  final TextEditingController pincodeCtrl;

  const OnboardSocietyStep0({
    super.key,
    required this.nameCtrl,
    required this.codeCtrl,
    required this.flatsCtrl,
    required this.addressCtrl,
    required this.cityCtrl,
    required this.stateCtrl,
    required this.pincodeCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: const ValueKey('step_0'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSectionHeader(
            title: 'Society Details',
            subtitle: 'Name, unique code identifier & location',
          ),
          AppSpacing.vGapSm,
          AppTextField(
            controller: nameCtrl,
            label: 'Society Full Name *',
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
                  controller: codeCtrl,
                  label: 'Code *',
                  hint: 'GWH',
                  textCapitalization: TextCapitalization.characters,
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Code required' : null,
                ),
              ),
              AppSpacing.hGapSm,
              Expanded(
                flex: 3,
                child: AppTextField(
                  controller: flatsCtrl,
                  label: 'Total Flats *',
                  hint: '120',
                  keyboardType: TextInputType.number,
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Flats required' : null,
                ),
              ),
            ],
          ),
          AppSpacing.vGapSm,
          AppTextField(
            controller: addressCtrl,
            label: 'Street Address *',
            hint: 'e.g. Plot 45, Kothrud',
            prefixIcon: const Icon(Icons.place_outlined),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Address required' : null,
          ),
          AppSpacing.vGapSm,
          Row(
            children: [
              Expanded(child: AppTextField(controller: cityCtrl, label: 'City')),
              AppSpacing.hGapSm,
              Expanded(child: AppTextField(controller: stateCtrl, label: 'State')),
              AppSpacing.hGapSm,
              Expanded(child: AppTextField(controller: pincodeCtrl, label: 'Pincode', keyboardType: TextInputType.number)),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardSocietyStep1 extends StatelessWidget {
  final String selectedPlan;
  final ValueChanged<String> onPlanChanged;
  final bool isDark;

  const OnboardSocietyStep1({
    super.key,
    required this.selectedPlan,
    required this.onPlanChanged,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: const ValueKey('step_1'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSectionHeader(
            title: 'Subscription Tier',
            subtitle: 'Automated billing plan and flat quota',
          ),
          AppSpacing.vGapSm,
          DropdownButtonFormField<String>(
            initialValue: selectedPlan,
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
              DropdownMenuItem(value: 'Starter (Up to 50 Flats)', child: Text('Starter - ₹2,500/mo (Up to 50 Flats)')),
              DropdownMenuItem(value: 'Pro / Standard (Up to 200 Flats)', child: Text('Pro / Standard - ₹5,000/mo (Up to 200 Flats)')),
              DropdownMenuItem(value: 'Enterprise / Large (Unlimited)', child: Text('Enterprise - ₹12,000/mo (Unlimited Flats)')),
            ],
            onChanged: (val) {
              if (val != null) onPlanChanged(val);
            },
          ),
        ],
      ),
    );
  }
}

class OnboardSocietyStep2 extends StatelessWidget {
  final TextEditingController adminNameCtrl;
  final TextEditingController adminPhoneCtrl;
  final TextEditingController adminEmailCtrl;

  const OnboardSocietyStep2({
    super.key,
    required this.adminNameCtrl,
    required this.adminPhoneCtrl,
    required this.adminEmailCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: const ValueKey('step_2'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSectionHeader(
            title: 'Primary Administrator',
            subtitle: 'Chairman or manager root credential for access',
          ),
          AppSpacing.vGapSm,
          AppTextField(
            controller: adminNameCtrl,
            label: 'Admin Full Name *',
            hint: 'e.g. Rajesh Deshmukh',
            prefixIcon: const Icon(Icons.person_outline),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Admin name required' : null,
          ),
          AppSpacing.vGapSm,
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  controller: adminPhoneCtrl,
                  label: 'Admin Mobile *',
                  hint: '9822334455',
                  prefixIcon: const Icon(Icons.phone_outlined),
                  keyboardType: TextInputType.phone,
                  validator: (v) => (v == null || v.trim().length < 8) ? 'Valid phone required' : null,
                ),
              ),
              AppSpacing.hGapSm,
              Expanded(
                child: AppTextField(
                  controller: adminEmailCtrl,
                  label: 'Admin Email *',
                  hint: 'admin@greenwoods.in',
                  prefixIcon: const Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => (v == null || !v.contains('@')) ? 'Valid email required' : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
