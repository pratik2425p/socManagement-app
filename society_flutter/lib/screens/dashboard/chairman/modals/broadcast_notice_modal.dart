import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

void showBroadcastNoticeModal(BuildContext context, SocietyState state) {
  AppBottomSheet.show(
    context: context,
    title: 'Broadcast Official Notice / Circular',
    subtitle: 'Sends push notification and displays on all resident dashboards',
    child: _BroadcastNoticeContent(state: state),
  );
}

class _BroadcastNoticeContent extends StatefulWidget {
  final SocietyState state;
  const _BroadcastNoticeContent({required this.state});

  @override
  State<_BroadcastNoticeContent> createState() => _BroadcastNoticeContentState();
}

class _BroadcastNoticeContentState extends State<_BroadcastNoticeContent> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _category = 'General Circular';
  String _priority = 'Standard';
  bool _isPublishing = false;

  final _categories = ['General Circular', 'Water & Maintenance', 'Security & Gate', 'AGM / Meeting', 'Emergency'];
  final _priorities = ['Standard', 'Urgent', 'High Priority'];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isPublishing = true);

    await widget.state.publishNotice(
      title: _titleController.text.trim(),
      content: _contentController.text.trim(),
      category: _category,
      priority: _priority,
    );

    if (mounted) {
      Navigator.pop(context);
      AppSnackbar.showSuccess(context, 'Notice broadcasted to all residents!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Notice Category *', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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

          const Text('Priority Level *', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          AppSpacing.vGapSm,
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: _priorities.map((p) {
              final isSelected = _priority == p;
              return ChoiceChip(
                label: Text(p),
                selected: isSelected,
                selectedColor: p == 'Urgent' ? AppColors.warningContainer : AppColors.primaryContainer,
                labelStyle: TextStyle(
                  color: p == 'Urgent' ? AppColors.warningDark : (isSelected ? AppColors.primaryNavy : AppColors.textSecondary(context)),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12,
                ),
                onSelected: (val) {
                  if (val) setState(() => _priority = p);
                },
              );
            }).toList(),
          ),
          AppSpacing.vGapLg,

          AppTextField(
            controller: _titleController,
            label: 'Notice Title *',
            hint: 'e.g. Annual Water Tank Cleaning on Thursday',
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter notice title' : null,
          ),
          AppSpacing.vGapMd,

          AppTextField(
            controller: _contentController,
            label: 'Notice Announcement Text *',
            hint: 'Describe schedule, affected wings, emergency contact...',
            maxLines: 4,
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter content' : null,
          ),
          AppSpacing.vGapXl,

          AppButton.primary(
            label: 'Publish Notice Broadcast',
            icon: Icons.campaign_rounded,
            isLoading: _isPublishing,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
