import 'package:flutter/material.dart';
import '../../../../core/core.dart';

/// Wizard Step 1: Society Registration & Legal Profile
class Step1Profile extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController codeController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController pincodeController;

  const Step1Profile({
    super.key,
    required this.nameController,
    required this.codeController,
    required this.addressController,
    required this.cityController,
    required this.pincodeController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(
          title: 'Society Legal Details',
          subtitle: 'Official society name and state registration code',
          padding: EdgeInsets.zero,
        ),
        AppSpacing.vGapMd,
        AppTextField(
          controller: nameController,
          label: 'Society Full Name *',
          hint: 'e.g. Shree Samarth Co-op Housing Society Ltd.',
          prefixIcon: const Icon(Icons.apartment_rounded, size: 20),
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter society name' : null,
        ),
        AppSpacing.vGapMd,
        AppTextField(
          controller: codeController,
          label: 'Registration Code / Society ID *',
          hint: 'e.g. SAMARTH01',
          prefixIcon: const Icon(Icons.badge_outlined, size: 20),
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter code' : null,
        ),
        AppSpacing.vGapMd,
        AppTextField(
          controller: addressController,
          label: 'Campus Physical Address *',
          hint: 'e.g. Plot 42, Sector 14, Palm Beach Road',
          prefixIcon: const Icon(Icons.location_on_outlined, size: 20),
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter address' : null,
        ),
        AppSpacing.vGapMd,
        Row(
          children: [
            Expanded(
              flex: 2,
              child: AppTextField(
                controller: cityController,
                label: 'City / District *',
                hint: 'e.g. Navi Mumbai',
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter city' : null,
              ),
            ),
            AppSpacing.hGapMd,
            Expanded(
              flex: 1,
              child: AppTextField(
                controller: pincodeController,
                label: 'PIN Code *',
                hint: '400703',
                keyboardType: TextInputType.number,
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter PIN' : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
