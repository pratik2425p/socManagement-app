import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

void showGuardNewVisitorModal(BuildContext context, SocietyState state) {
  AppBottomSheet.show(
    context: context,
    title: 'Register Walk-In Visitor',
    subtitle: 'Sends instant gate approval notification to resident',
    child: _GuardNewVisitorContent(state: state),
  );
}

class _GuardNewVisitorContent extends StatefulWidget {
  final SocietyState state;
  const _GuardNewVisitorContent({required this.state});

  @override
  State<_GuardNewVisitorContent> createState() => _GuardNewVisitorContentState();
}

class _GuardNewVisitorContentState extends State<_GuardNewVisitorContent> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _flatController = TextEditingController();
  final _vehicleController = TextEditingController();
  String _purpose = 'Delivery';
  bool _isSaving = false;

  final _purposes = ['Delivery', 'Guest', 'Cab / Taxi', 'Repair / Service', 'Vendor'];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _flatController.dispose();
    _vehicleController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);

    await widget.state.guardRecordEntry(
      visitorName: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      flatNumber: _flatController.text.trim().toUpperCase(),
      purpose: _purpose,
      vehicle: _vehicleController.text.trim().isNotEmpty
          ? _vehicleController.text.trim().toUpperCase()
          : null,
    );

    if (mounted) {
      Navigator.pop(context);
      AppSnackbar.showSuccess(
        context,
        'Visitor registered! Approval request sent to Flat ${_flatController.text.trim().toUpperCase()}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Purpose / Type *', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          AppSpacing.vGapSm,
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: _purposes.map((p) {
              final isSelected = _purpose == p;
              return ChoiceChip(
                label: Text(p),
                selected: isSelected,
                selectedColor: AppColors.primaryContainer,
                labelStyle: TextStyle(
                  color: isSelected ? AppColors.primaryNavy : AppColors.textSecondary(context),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12,
                ),
                onSelected: (val) {
                  if (val) setState(() => _purpose = p);
                },
              );
            }).toList(),
          ),
          AppSpacing.vGapLg,

          AppTextField(
            controller: _nameController,
            label: 'Visitor Full Name *',
            hint: 'e.g. Amazon Courier / Amit Verma',
            prefixIcon: const Icon(Icons.person_outline, size: 20),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter visitor name' : null,
          ),
          AppSpacing.vGapMd,

          AppTextField(
            controller: _phoneController,
            label: 'Visitor Mobile Number *',
            hint: 'e.g. 9811223344',
            keyboardType: TextInputType.phone,
            prefixIcon: const Icon(Icons.phone_outlined, size: 20),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter mobile number' : null,
          ),
          AppSpacing.vGapMd,

          AppTextField(
            controller: _flatController,
            label: 'Visiting Flat Number *',
            hint: 'e.g. A-304',
            prefixIcon: const Icon(Icons.home_outlined, size: 20),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter flat number' : null,
          ),
          AppSpacing.vGapMd,

          AppTextField(
            controller: _vehicleController,
            label: 'Vehicle Number (Optional)',
            hint: 'e.g. MH 43 AB 1234',
            prefixIcon: const Icon(Icons.directions_car_outlined, size: 20),
          ),
          AppSpacing.vGapXl,

          AppButton.primary(
            label: 'Send Gate Approval to Resident',
            icon: Icons.send_rounded,
            isLoading: _isSaving,
            onPressed: _handleSubmit,
          ),
        ],
      ),
    );
  }
}
