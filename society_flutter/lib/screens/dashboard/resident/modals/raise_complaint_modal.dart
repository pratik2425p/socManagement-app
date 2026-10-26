import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

void showRaiseComplaintModal(BuildContext context, SocietyState state) {
  AppBottomSheet.show(
    context: context,
    title: 'Raise Helpdesk Complaint',
    subtitle: 'Tracked by Society Committee & Facility Staff',
    child: _RaiseComplaintContent(state: state),
  );
}

class _RaiseComplaintContent extends StatefulWidget {
  final SocietyState state;
  const _RaiseComplaintContent({required this.state});

  @override
  State<_RaiseComplaintContent> createState() => _RaiseComplaintContentState();
}

class _RaiseComplaintContentState extends State<_RaiseComplaintContent> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  String _category = 'Plumbing';
  bool _isSubmitting = false;

  final _categories = ['Plumbing', 'Electrical', 'Lift Issue', 'Security', 'Carpentry', 'General'];

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);

    await widget.state.addComplaint(
      title: _titleController.text.trim(),
      description: _descController.text.trim(),
      category: _category,
    );

    if (mounted) {
      Navigator.pop(context);
      AppSnackbar.showSuccess(context, 'Ticket created! Assigned to facilities staff.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Issue Category *', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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
            label: 'Issue Summary *',
            hint: 'e.g. Low water pressure in master bathroom',
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter summary' : null,
          ),
          AppSpacing.vGapMd,

          AppTextField(
            controller: _descController,
            label: 'Detailed Description *',
            hint: 'Describe when it started and exact location...',
            maxLines: 3,
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please provide details' : null,
          ),
          AppSpacing.vGapXl,

          AppButton.primary(
            label: 'Submit Ticket',
            icon: Icons.send_rounded,
            isLoading: _isSubmitting,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
