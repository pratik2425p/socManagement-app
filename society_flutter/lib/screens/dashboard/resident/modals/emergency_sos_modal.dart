import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

void showEmergencySosModal(BuildContext context, SocietyState state) {
  AppBottomSheet.show(
    context: context,
    title: '🚨 Emergency SOS Alarm',
    subtitle: 'Alerts Main Security Gate & Society Chairman immediately',
    child: _SosModalContent(state: state),
  );
}

class _SosModalContent extends StatefulWidget {
  final SocietyState state;
  const _SosModalContent({required this.state});

  @override
  State<_SosModalContent> createState() => _SosModalContentState();
}

class _SosModalContentState extends State<_SosModalContent> {
  EmergencyType _selectedType = EmergencyType.medical;
  final _descController = TextEditingController();
  bool _isTriggering = false;

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  Future<void> _handleTrigger() async {
    final confirmed = await AppConfirmDialog.show(
      context: context,
      title: 'Sound Emergency Siren?',
      message: 'This will sound an audio-visual alarm at the Security Gatehouse and dispatch emergency assistance to Flat ${widget.state.currentFlat}.',
      confirmLabel: 'TRIGGER ALARM NOW',
      isDestructive: true,
      icon: Icons.emergency_rounded,
    );

    if (!confirmed || !mounted) return;

    setState(() => _isTriggering = true);
    await widget.state.triggerSos(
      type: _selectedType,
      note: _descController.text.trim().isNotEmpty
          ? _descController.text.trim()
          : null,
    );

    if (mounted) {
      Navigator.pop(context);
      AppSnackbar.showError(
        context,
        '🚨 Emergency SOS Dispatched! Security guard has been alerted.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final types = [
      (EmergencyType.medical, 'Medical Emergency', Icons.medical_services_rounded, AppColors.error),
      (EmergencyType.fire, 'Fire Emergency', Icons.local_fire_department_rounded, AppColors.warning),
      (EmergencyType.liftStuck, 'Lift Stuck', Icons.elevator_rounded, const Color(0xFFD97706)),
      (EmergencyType.securityThreat, 'Security Threat / Intruder', Icons.shield_rounded, AppColors.primaryNavy),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: AppSpacing.insetAllMd,
          decoration: BoxDecoration(
            color: AppColors.errorContainer,
            borderRadius: AppRadii.borderMd,
            border: Border.all(color: AppColors.errorBorder),
          ),
          child: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 22),
              AppSpacing.hGapMd,
              Expanded(
                child: Text(
                  'Triggering SOS sends instant alert notifications and sounds sirens for on-duty guards.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.errorDark,
                  ),
                ),
              ),
            ],
          ),
        ),
        AppSpacing.vGapLg,

        const Text(
          'Select Emergency Category *',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        AppSpacing.vGapSm,

        ...types.map((item) {
          final isSelected = _selectedType == item.$1;
          return AppCard(
            onTap: () => setState(() => _selectedType = item.$1),
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            borderColor: isSelected ? item.$4 : null,
            color: isSelected
                ? item.$4.withValues(alpha: isDark ? 0.2 : 0.08)
                : null,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: item.$4.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(item.$3, color: item.$4, size: 20),
                ),
                AppSpacing.hGapMd,
                Expanded(
                  child: Text(
                    item.$2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected ? item.$4 : AppColors.textPrimary(context),
                    ),
                  ),
                ),
                if (isSelected)
                  Icon(Icons.radio_button_checked, color: item.$4, size: 20)
                else
                  const Icon(Icons.radio_button_off, color: Colors.grey, size: 20),
              ],
            ),
          );
        }),
        AppSpacing.vGapMd,

        AppTextField(
          controller: _descController,
          label: 'Brief Details (Optional)',
          hint: 'e.g. Elderly person fell in bedroom, urgent stretcher required',
          maxLines: 2,
        ),
        AppSpacing.vGapXl,

        AppButton.destructive(
          label: 'DISPATCH EMERGENCY SOS',
          icon: Icons.emergency_rounded,
          isLoading: _isTriggering,
          isFullWidth: true,
          onPressed: _handleTrigger,
        ),
      ],
    );
  }
}
