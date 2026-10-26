import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../core/core.dart';
import '../../../services/society_state.dart';

void showCreateUserDialog(BuildContext context, SocietyState state) {
  showDialog(
    context: context,
    builder: (ctx) => CreateUserDialog(state: state),
  );
}

/// Accessible Keyboard-Safe Dialog to Register Fresh User
class CreateUserDialog extends StatefulWidget {
  final SocietyState state;
  const CreateUserDialog({super.key, required this.state});

  @override
  State<CreateUserDialog> createState() => _CreateUserDialogState();
}

class _CreateUserDialogState extends State<CreateUserDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _flatController = TextEditingController();

  UserRole _selectedRole = UserRole.resident;
  bool _makeActive = true;
  bool _isSubmitting = false;
  String? _errorMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _flatController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    try {
      final user = await widget.state.createNewUser(
        fullName: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        role: _selectedRole,
        flatNumber: _flatController.text.trim().isNotEmpty
            ? _flatController.text.trim().toUpperCase()
            : null,
        makeActive: _makeActive,
      );

      if (user != null && mounted) {
        Navigator.pop(context);
        AppSnackbar.showSuccess(
          context,
          'User "${user.fullName}" registered in PostgreSQL and activated!',
        );
      } else {
        setState(() {
          _errorMessage = 'Failed to register user. Please check database logs.';
          _isSubmitting = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: $e';
        _isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: AppRadii.borderXl),
      backgroundColor: isDark ? AppColors.surfaceDark : Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.xl),
      child: SingleChildScrollView(
        padding: AppSpacing.insetAllXxl,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: AppSpacing.insetAllMd,
                    decoration: BoxDecoration(
                      color: AppColors.accentTeal.withValues(alpha: 0.15),
                      borderRadius: AppRadii.borderMd,
                    ),
                    child: const Icon(
                      Icons.person_add_alt_1_rounded,
                      color: AppColors.accentTeal,
                      size: 24,
                    ),
                  ),
                  AppSpacing.hGapMd,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register Fresh User',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                          ),
                        ),
                        Text(
                          'Saves directly to PostgreSQL via Serverpod',
                          style: TextStyle(
                            fontSize: 11,
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppSpacing.vGapLg,

              if (_errorMessage != null) ...[
                Container(
                  padding: AppSpacing.insetAllMd,
                  decoration: BoxDecoration(
                    color: AppColors.errorContainer,
                    borderRadius: AppRadii.borderSm,
                    border: Border.all(color: AppColors.errorBorder),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: AppColors.error, size: 18),
                      AppSpacing.hGapSm,
                      Expanded(
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: AppColors.errorDark, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpacing.vGapMd,
              ],

              AppTextField(
                controller: _nameController,
                label: 'Full Name *',
                hint: 'e.g. Ramesh Kadam',
                prefixIcon: const Icon(Icons.person_outline, size: 20),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return 'Please enter full name';
                  return null;
                },
              ),
              AppSpacing.vGapMd,

              AppTextField(
                controller: _phoneController,
                label: 'Mobile Number *',
                hint: 'e.g. 9822334455',
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone_outlined, size: 20),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return 'Please enter mobile number';
                  if (val.trim().length < 8) return 'Enter a valid mobile number';
                  return null;
                },
              ),
              AppSpacing.vGapMd,

              AppTextField(
                controller: _emailController,
                label: 'Email Address *',
                hint: 'e.g. ramesh@samarth.in',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined, size: 20),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return 'Please enter email address';
                  if (!val.contains('@')) return 'Enter a valid email';
                  return null;
                },
              ),
              AppSpacing.vGapMd,

              Text(
                'User Role *',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textPrimaryLight,
                ),
              ),
              AppSpacing.vGapXs,
              DropdownButtonFormField<UserRole>(
                initialValue: _selectedRole,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.badge_outlined, size: 20),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(borderRadius: AppRadii.borderMd),
                ),
                items: const [
                  DropdownMenuItem(
                    value: UserRole.resident,
                    child: Text('🏠 Resident (Flat Owner / Tenant)', style: TextStyle(fontSize: 13)),
                  ),
                  DropdownMenuItem(
                    value: UserRole.guard,
                    child: Text('🛡️ Security Guard', style: TextStyle(fontSize: 13)),
                  ),
                  DropdownMenuItem(
                    value: UserRole.chairman,
                    child: Text('🏛️ Chairman / Committee', style: TextStyle(fontSize: 13)),
                  ),
                  DropdownMenuItem(
                    value: UserRole.accountant,
                    child: Text('📊 Accountant (Ledger)', style: TextStyle(fontSize: 13)),
                  ),
                  DropdownMenuItem(
                    value: UserRole.admin,
                    child: Text('🌐 SaaS Super Admin', style: TextStyle(fontSize: 13)),
                  ),
                ],
                onChanged: (role) {
                  if (role != null) setState(() => _selectedRole = role);
                },
              ),
              AppSpacing.vGapMd,

              AppTextField(
                controller: _flatController,
                label: _selectedRole == UserRole.resident
                    ? 'Flat Number *'
                    : 'Flat Number (Optional)',
                hint: 'e.g. B-402',
                prefixIcon: const Icon(Icons.home_outlined, size: 20),
                validator: (val) {
                  if (_selectedRole == UserRole.resident &&
                      (val == null || val.trim().isEmpty)) {
                    return 'Flat number is required for residents';
                  }
                  return null;
                },
              ),
              AppSpacing.vGapSm,

              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: _makeActive,
                title: const Text(
                  'Switch to this new user immediately',
                  style: TextStyle(fontSize: 13),
                ),
                activeColor: AppColors.accentTeal,
                onChanged: (val) => setState(() => _makeActive = val ?? true),
              ),
              AppSpacing.vGapLg,

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton.text(
                    label: 'Cancel',
                    onPressed: _isSubmitting ? null : () => Navigator.pop(context),
                    height: 42,
                  ),
                  AppSpacing.hGapSm,
                  AppButton.secondary(
                    label: 'Save & Activate',
                    isLoading: _isSubmitting,
                    onPressed: _submit,
                    height: 42,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
