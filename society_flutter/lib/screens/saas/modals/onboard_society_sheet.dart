import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../../../services/society_state.dart';
import 'onboard_society_steps.dart';

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
  int _currentStep = 0;
  bool _isSubmitting = false;

  bool _validateStep(int step) {
    if (step == 0) {
      return _nameCtrl.text.trim().isNotEmpty &&
          _codeCtrl.text.trim().isNotEmpty &&
          _flatsCtrl.text.trim().isNotEmpty &&
          _addressCtrl.text.trim().isNotEmpty;
    }
    if (step == 2) {
      return _adminNameCtrl.text.trim().isNotEmpty &&
          _adminPhoneCtrl.text.trim().length >= 8 &&
          _adminEmailCtrl.text.contains('@');
    }
    return true;
  }

  void _nextStep() {
    if (!_validateStep(_currentStep)) {
      _formKey.currentState?.validate();
      return;
    }
    if (_currentStep < 2) {
      setState(() => _currentStep++);
    } else {
      _handleSubmit();
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

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
            Row(
              children: [
                _buildStepPill(0, '1. Society', isDark),
                AppSpacing.hGapXs,
                const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
                AppSpacing.hGapXs,
                _buildStepPill(1, '2. Plan', isDark),
                AppSpacing.hGapXs,
                const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
                AppSpacing.hGapXs,
                _buildStepPill(2, '3. Admin', isDark),
              ],
            ),
            AppSpacing.vGapLg,
            AnimatedSwitcher(
              duration: AppMotion.base,
              switchInCurve: AppMotion.standard,
              switchOutCurve: AppMotion.standard,
              child: _buildCurrentStep(isDark),
            ),
            AppSpacing.vGapLg,
            Row(
              children: [
                if (_currentStep > 0) ...[
                  Expanded(
                    child: AppButton.outline(
                      label: 'Back',
                      icon: Icons.arrow_back,
                      onPressed: _prevStep,
                    ),
                  ),
                  AppSpacing.hGapSm,
                ],
                Expanded(
                  flex: 2,
                  child: AppButton(
                    label: _currentStep == 2
                        ? 'Provision & Activate'
                        : 'Continue',
                    icon: _currentStep == 2
                        ? Icons.check_circle_outline_rounded
                        : Icons.arrow_forward_rounded,
                    isLoading: _isSubmitting,
                    onPressed: _nextStep,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepPill(int index, String title, bool isDark) {
    final isActive = _currentStep == index;
    final isDone = _currentStep > index;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primaryNavy
              : (isDone
                  ? AppColors.success.withValues(alpha: 0.15)
                  : (isDark ? AppColors.surfaceElevatedDark : AppColors.surfaceLight)),
          borderRadius: AppRadii.borderSm,
          border: Border.all(
            color: isActive
                ? AppColors.primaryNavy
                : (isDone ? AppColors.success : (isDark ? AppColors.borderDark : AppColors.borderLight)),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isActive || isDone ? FontWeight.bold : FontWeight.normal,
            color: isActive
                ? Colors.white
                : (isDone
                    ? AppColors.success
                    : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStep(bool isDark) {
    switch (_currentStep) {
      case 0:
        return OnboardSocietyStep0(
          nameCtrl: _nameCtrl,
          codeCtrl: _codeCtrl,
          flatsCtrl: _flatsCtrl,
          addressCtrl: _addressCtrl,
          cityCtrl: _cityCtrl,
          stateCtrl: _stateCtrl,
          pincodeCtrl: _pincodeCtrl,
        );
      case 1:
        return OnboardSocietyStep1(
          selectedPlan: _selectedPlan,
          onPlanChanged: (val) => setState(() => _selectedPlan = val),
          isDark: isDark,
        );
      case 2:
      default:
        return OnboardSocietyStep2(
          adminNameCtrl: _adminNameCtrl,
          adminPhoneCtrl: _adminPhoneCtrl,
          adminEmailCtrl: _adminEmailCtrl,
        );
    }
  }
}
