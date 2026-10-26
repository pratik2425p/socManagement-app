import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../../services/society_state.dart';
import 'member_invitations_screen.dart';
import 'wizard_steps/step1_profile.dart';
import 'wizard_steps/step2_wings_flats.dart';
import 'wizard_steps/step3_staff.dart';
import 'wizard_steps/step4_owner_import.dart';
import 'wizard_steps/step5_finance.dart';
import 'wizard_steps/step6_review.dart';

/// Redesigned 6-Step Society Setup & Onboarding Wizard (<240 lines)
class SocietySetupWizardScreen extends StatefulWidget {
  final SocietyState state;
  const SocietySetupWizardScreen({super.key, required this.state});

  @override
  State<SocietySetupWizardScreen> createState() => _SocietySetupWizardScreenState();
}

class _SocietySetupWizardScreenState extends State<SocietySetupWizardScreen> {
  int _currentStep = 0;

  // Controllers
  late final TextEditingController _nameCtrl;
  late final TextEditingController _codeCtrl;
  late final TextEditingController _addressCtrl;
  late final TextEditingController _cityCtrl;
  late final TextEditingController _pinCtrl;

  final _wingNameCtrl = TextEditingController(text: 'Wing A');
  final _floorsCtrl = TextEditingController(text: '7');
  final _flatsPerFloorCtrl = TextEditingController(text: '4');
  List<String> _generatedFlats = [];

  final _guardNameCtrl = TextEditingController(text: 'Santosh Gawde');
  final _guardPhoneCtrl = TextEditingController(text: '9811223344');
  final _accountantNameCtrl = TextEditingController(text: 'Sunil Mehta');
  final _accountantPhoneCtrl = TextEditingController(text: '9765443322');

  final _csvCtrl = TextEditingController();
  List<CsvRowValidation> _parsedRows = [];

  final _baseAmountCtrl = TextEditingController(text: '2450');
  final _dueDayCtrl = TextEditingController(text: '10');
  final _lateFeeCtrl = TextEditingController(text: '150');

  final List<String> _stepTitles = ['Profile', 'Flats', 'Staff', 'Owners', 'Finance', 'Review'];

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.state.societyName);
    _codeCtrl = TextEditingController(text: widget.state.currentSociety?.code ?? 'SAMARTH01');
    _addressCtrl = TextEditingController(text: widget.state.currentSociety?.address ?? 'Plot 42, Sector 14');
    _cityCtrl = TextEditingController(text: widget.state.currentSociety?.city ?? 'Navi Mumbai');
    _pinCtrl = TextEditingController(text: widget.state.currentSociety?.pincode ?? '400703');

    _generateFlats();
    _loadSampleCsv();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _codeCtrl.dispose();
    _addressCtrl.dispose();
    _cityCtrl.dispose();
    _pinCtrl.dispose();
    _wingNameCtrl.dispose();
    _floorsCtrl.dispose();
    _flatsPerFloorCtrl.dispose();
    _guardNameCtrl.dispose();
    _guardPhoneCtrl.dispose();
    _accountantNameCtrl.dispose();
    _accountantPhoneCtrl.dispose();
    _csvCtrl.dispose();
    _baseAmountCtrl.dispose();
    _dueDayCtrl.dispose();
    _lateFeeCtrl.dispose();
    super.dispose();
  }

  void _generateFlats() {
    final floors = int.tryParse(_floorsCtrl.text.trim()) ?? 7;
    final perFloor = int.tryParse(_flatsPerFloorCtrl.text.trim()) ?? 4;
    final prefix = _wingNameCtrl.text.trim().replaceAll('Wing', '').trim();

    final flats = <String>[];
    for (int f = 1; f <= floors; f++) {
      for (int u = 1; u <= perFloor; u++) {
        flats.add('${prefix.isNotEmpty ? "$prefix-" : ""}${f}0$u');
      }
    }
    setState(() => _generatedFlats = flats);
  }

  void _loadSampleCsv() {
    _csvCtrl.text =
        'Rahul Deshmukh,9822114455,rahul@samarth.in,A-101\n'
        'Pooja Kulkarni,9822336677,pooja@samarth.in,A-102\n'
        'Amit Shinde,9811223344,amit@samarth.in,A-201\n'
        'Sneha Joshi,9766554433,sneha@samarth.in,A-202';
    _parseCsv();
  }

  void _parseCsv() {
    final lines = _csvCtrl.text.trim().split('\n');
    final rows = <CsvRowValidation>[];

    for (final line in lines) {
      final parts = line.split(',');
      if (parts.length >= 4) {
        rows.add(CsvRowValidation(
          name: parts[0].trim(),
          phone: parts[1].trim(),
          email: parts[2].trim(),
          flat: parts[3].trim(),
          isValid: parts[1].trim().length >= 8,
          error: parts[1].trim().length < 8 ? 'Invalid phone' : null,
        ));
      }
    }
    setState(() => _parsedRows = rows);
  }

  void _handleNext() {
    if (_currentStep < 5) {
      setState(() => _currentStep += 1);
    } else {
      AppSnackbar.showSuccess(context, '🎉 Society Setup Finalized! Inviting members.');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => MemberInvitationsScreen(state: widget.state)),
      );
    }
  }

  Widget _buildStepBody() {
    switch (_currentStep) {
      case 0:
        return Step1Profile(
          nameController: _nameCtrl,
          codeController: _codeCtrl,
          addressController: _addressCtrl,
          cityController: _cityCtrl,
          pincodeController: _pinCtrl,
        );
      case 1:
        return Step2WingsFlats(
          wingNameController: _wingNameCtrl,
          floorsController: _floorsCtrl,
          flatsPerFloorController: _flatsPerFloorCtrl,
          generatedFlats: _generatedFlats,
          onGenerateFlats: _generateFlats,
          onClearFlats: () => setState(() => _generatedFlats.clear()),
        );
      case 2:
        return Step3Staff(
          guardNameController: _guardNameCtrl,
          guardPhoneController: _guardPhoneCtrl,
          accountantNameController: _accountantNameCtrl,
          accountantPhoneController: _accountantPhoneCtrl,
        );
      case 3:
        return Step4OwnerImport(
          csvController: _csvCtrl,
          parsedRows: _parsedRows,
          onParseCsv: _parseCsv,
          onLoadSampleCsv: _loadSampleCsv,
        );
      case 4:
        return Step5Finance(
          baseAmountController: _baseAmountCtrl,
          dueDateController: _dueDayCtrl,
          lateFeeController: _lateFeeCtrl,
        );
      case 5:
        return Step6Review(
          societyName: _nameCtrl.text,
          societyCode: _codeCtrl.text,
          address: _addressCtrl.text,
          totalFlats: _generatedFlats.length,
          guardName: _guardNameCtrl.text,
          accountantName: _accountantNameCtrl.text,
          validMembers: _parsedRows.where((r) => r.isValid).length,
          baseMaintenance: _baseAmountCtrl.text,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: 'Society Setup Wizard',
        subtitle: 'Step ${_currentStep + 1} of 6: ${_stepTitles[_currentStep]}',
      ),
      body: ResponsiveContainer(
        child: Column(
          children: [
          // Step Progress Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
            child: Row(
              children: List.generate(6, (idx) {
                final isDone = idx < _currentStep;
                final isCurrent = idx == _currentStep;

                return Expanded(
                  child: Container(
                    height: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: isDone || isCurrent
                          ? AppColors.primaryNavy
                          : AppColors.border(context),
                      borderRadius: AppRadii.borderFull,
                    ),
                  ),
                );
              }),
            ),
          ),
          const Divider(),

          // Scrollable Step Content
          Expanded(
            child: SingleChildScrollView(
              padding: AppSpacing.screenPadding,
              child: _buildStepBody(),
            ),
          ),

          // Bottom Navigation Bar
          Container(
            padding: AppSpacing.screenPadding,
            decoration: BoxDecoration(
              color: AppColors.surface(context),
              border: Border(top: BorderSide(color: AppColors.border(context))),
            ),
            child: Row(
              children: [
                if (_currentStep > 0)
                  Expanded(
                    child: AppButton.outline(
                      label: 'Previous',
                      onPressed: () => setState(() => _currentStep -= 1),
                    ),
                  )
                else
                  const Spacer(),
                AppSpacing.hGapMd,
                Expanded(
                  child: AppButton.primary(
                    label: _currentStep == 5 ? 'Confirm & Go Live' : 'Continue',
                    icon: _currentStep == 5 ? Icons.rocket_launch_rounded : Icons.arrow_forward_rounded,
                    onPressed: _handleNext,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  }
}
