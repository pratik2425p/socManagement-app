import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';
import 'digital_gate_pass_modal.dart';

void showPreApproveVisitorModal(BuildContext context, SocietyState state) {
  AppBottomSheet.show(
    context: context,
    title: 'Pre-Approve Visitor / Cab / Delivery',
    subtitle: 'Generates a 4-digit PIN for instant gate entry',
    child: _PreApproveVisitorContent(state: state),
  );
}

class _PreApproveVisitorContent extends StatefulWidget {
  final SocietyState state;
  const _PreApproveVisitorContent({required this.state});

  @override
  State<_PreApproveVisitorContent> createState() => _PreApproveVisitorContentState();
}

class _PreApproveVisitorContentState extends State<_PreApproveVisitorContent> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String _visitorType = 'Guest';
  bool _isGenerating = false;

  final List<String> _types = ['Guest', 'Cab', 'Delivery', 'Service / Repair', 'Family'];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleGenerate() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isGenerating = true);
    final entry = await widget.state.preApproveVisitor(
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      purpose: _visitorType,
    );
    setState(() => _isGenerating = false);

    if (!mounted) return;

    Navigator.pop(context); // Close request modal
    if (entry != null) {
      showDigitalGatePassModal(context, entry);
    } else {
      AppSnackbar.showError(context, 'Failed to generate gate pass. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Category Selector Chips
          const Text(
            'Visitor Category *',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          AppSpacing.vGapSm,
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: _types.map((type) {
              final isSelected = _visitorType == type;
              return ChoiceChip(
                label: Text(type),
                selected: isSelected,
                selectedColor: AppColors.primaryContainer,
                labelStyle: TextStyle(
                  color: isSelected ? AppColors.primaryNavy : AppColors.textSecondary(context),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12,
                ),
                onSelected: (val) {
                  if (val) setState(() => _visitorType = type);
                },
              );
            }).toList(),
          ),
          AppSpacing.vGapLg,

          AppTextField(
            controller: _nameController,
            label: 'Visitor / Driver Name *',
            hint: 'e.g. Swiggy Delivery / Amit Shah',
            prefixIcon: const Icon(Icons.person_outline, size: 20),
            validator: (val) {
              if (val == null || val.trim().isEmpty) return 'Please enter visitor name';
              return null;
            },
          ),
          AppSpacing.vGapMd,

          AppTextField(
            controller: _phoneController,
            label: 'Phone Number (Optional)',
            hint: 'e.g. 9822114455',
            keyboardType: TextInputType.phone,
            prefixIcon: const Icon(Icons.phone_outlined, size: 20),
          ),
          AppSpacing.vGapXl,

          AppButton.primary(
            label: 'Generate Digital Gate Pass',
            icon: Icons.vpn_key_rounded,
            isLoading: _isGenerating,
            onPressed: _handleGenerate,
          ),
        ],
      ),
    );
  }
}
