import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../../services/society_state.dart';

/// Redesigned Member Onboarding via 6-Digit Invitation Code
class AcceptInvitationScreen extends StatefulWidget {
  final SocietyState state;
  final String? initialInviteCode;
  final String? initialPhone;

  const AcceptInvitationScreen({
    super.key,
    required this.state,
    this.initialInviteCode,
    this.initialPhone,
  });

  @override
  State<AcceptInvitationScreen> createState() => _AcceptInvitationScreenState();
}

class _AcceptInvitationScreenState extends State<AcceptInvitationScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _codeCtrl;
  late final TextEditingController _phoneCtrl;

  bool _isVerifying = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _codeCtrl = TextEditingController(text: widget.initialInviteCode ?? '');
    _phoneCtrl = TextEditingController(text: widget.initialPhone ?? '');
  }

  @override
  void dispose() {
    _codeCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleAccept() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isVerifying = true;
      _errorMessage = null;
    });

    final user = await widget.state.acceptMemberInvitation(
      inviteCode: _codeCtrl.text.trim(),
      phone: _phoneCtrl.text.trim(),
    );

    setState(() => _isVerifying = false);

    if (user != null && mounted) {
      widget.state.setActiveUser(user);
      AppSnackbar.showSuccess(
        context,
        '🎉 Welcome to ${widget.state.societyName}! You are connected as ${user.fullName} (${user.role.name}).',
      );
      Navigator.pop(context);
    } else if (mounted) {
      setState(() {
        _errorMessage = 'Invalid or expired invitation code. Please verify with your Society Chairman.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: 'Accept Society Invitation',
        subtitle: 'Link your mobile number to your apartment flat',
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.screenPadding,
        child: ResponsiveContainer(
          maxWidth: 680,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              // Hero Info Card
              AppCard(
                color: AppColors.primaryContainer,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryNavy,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.vpn_key_rounded, color: Colors.white, size: 24),
                    ),
                    AppSpacing.hGapMd,
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Member Invitation Code',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.primaryDark),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Enter the 6-character code sent to your SMS or email by the committee.',
                            style: TextStyle(fontSize: 11, color: AppColors.primaryDark),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.vGapXl,

              if (_errorMessage != null) ...[
                Container(
                  padding: AppSpacing.insetAllMd,
                  decoration: BoxDecoration(
                    color: AppColors.errorContainer,
                    borderRadius: AppRadii.borderMd,
                    border: Border.all(color: AppColors.errorBorder),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline_rounded, color: AppColors.error, size: 20),
                      AppSpacing.hGapMd,
                      Expanded(
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: AppColors.errorDark, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpacing.vGapLg,
              ],

              AppTextField(
                controller: _codeCtrl,
                label: '6-Character Invitation Code *',
                hint: 'e.g. SAM789',
                prefixIcon: const Icon(Icons.lock_outline_rounded, size: 20),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Please enter invite code';
                  if (v.trim().length < 4) return 'Enter a valid invite code';
                  return null;
                },
              ),
              AppSpacing.vGapLg,

              AppTextField(
                controller: _phoneCtrl,
                label: 'Registered Mobile Number *',
                hint: 'e.g. 9822011223',
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone_outlined, size: 20),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Please enter mobile number';
                  if (v.trim().length < 8) return 'Enter a valid phone number';
                  return null;
                },
              ),
              AppSpacing.vGapXxl,

              AppButton.primary(
                label: 'Verify Code & Join Society',
                icon: Icons.check_circle_rounded,
                isLoading: _isVerifying,
                onPressed: _handleAccept,
              ),
            ],
          ),
        ),
      ),
    ),
  );
  }
}
