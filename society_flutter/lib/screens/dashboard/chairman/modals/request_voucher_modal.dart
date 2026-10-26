import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

void showRequestVoucherModal(BuildContext context, SocietyState state) {
  AppBottomSheet.show(
    context: context,
    title: 'Raise Expense Voucher Request',
    subtitle: 'Submitted for Chairman approval before Accountant posts to Ledger',
    child: _RequestVoucherContent(state: state),
  );
}

class _RequestVoucherContent extends StatefulWidget {
  final SocietyState state;
  const _RequestVoucherContent({required this.state});

  @override
  State<_RequestVoucherContent> createState() => _RequestVoucherContentState();
}

class _RequestVoucherContentState extends State<_RequestVoucherContent> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _amountController = TextEditingController();
  String _category = 'Repairs & Maintenance';
  bool _isSubmitting = false;

  final _categories = ['Repairs & Maintenance', 'Security & Guard Payroll', 'Garden & Landscaping', 'Electricity & Diesel Gen', 'Legal & Audit'];

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);

    final amount = double.tryParse(_amountController.text.trim()) ?? 0.0;
    await widget.state.createVoucher(
      title: _titleController.text.trim(),
      description: _descController.text.trim(),
      amount: amount,
      category: _category,
    );

    if (mounted) {
      Navigator.pop(context);
      AppSnackbar.showSuccess(context, 'Expense voucher request submitted for Chairman approval!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Expense Category *', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          AppSpacing.vGapSm,
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: _categories.map((c) {
              final isSelected = _category == c;
              return ChoiceChip(
                label: Text(c),
                selected: isSelected,
                selectedColor: AppColors.primaryContainer,
                labelStyle: TextStyle(
                  color: isSelected ? AppColors.primaryNavy : AppColors.textSecondary(context),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12,
                ),
                onSelected: (val) {
                  if (val) setState(() => _category = c);
                },
              );
            }).toList(),
          ),
          AppSpacing.vGapLg,

          AppTextField(
            controller: _titleController,
            label: 'Expense Purpose / Title *',
            hint: 'e.g. Wing B Lift Motor Bearing Replacement',
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter title' : null,
          ),
          AppSpacing.vGapMd,

          AppTextField(
            controller: _amountController,
            label: 'Voucher Amount (₹) *',
            hint: 'e.g. 4500',
            keyboardType: TextInputType.number,
            prefixIcon: const Icon(Icons.currency_rupee, size: 20),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Please enter amount';
              if (double.tryParse(v.trim()) == null) return 'Enter a valid number';
              return null;
            },
          ),
          AppSpacing.vGapMd,

          AppTextField(
            controller: _descController,
            label: 'Vendor & Quotation Details *',
            hint: 'Vendor name, invoice quote reference, vendor bank details...',
            maxLines: 3,
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter description' : null,
          ),
          AppSpacing.vGapXl,

          AppButton.secondary(
            label: 'Submit for Chairman Approval',
            icon: Icons.assignment_turned_in_rounded,
            isLoading: _isSubmitting,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
