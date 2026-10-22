import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../services/society_state.dart';
import '../../theme/app_theme.dart';

void showUserManagementSheet(BuildContext context, SocietyState state) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => _UserManagementBottomSheet(state: state),
  );
}

class _UserManagementBottomSheet extends StatefulWidget {
  final SocietyState state;
  const _UserManagementBottomSheet({required this.state});

  @override
  State<_UserManagementBottomSheet> createState() => _UserManagementBottomSheetState();
}

class _UserManagementBottomSheetState extends State<_UserManagementBottomSheet> {
  @override
  void initState() {
    super.initState();
    widget.state.addListener(_onStateChange);
  }

  @override
  void dispose() {
    widget.state.removeListener(_onStateChange);
    super.dispose();
  }

  void _onStateChange() {
    if (mounted) setState(() {});
  }

  String _getRoleDisplayName(UserRole role) {
    switch (role) {
      case UserRole.resident:
        return '🏠 Resident';
      case UserRole.guard:
        return '🛡️ Guard';
      case UserRole.chairman:
        return '🏛️ Chairman';
      case UserRole.committee:
        return '👥 Committee';
      case UserRole.accountant:
        return '📊 Accountant';
      case UserRole.admin:
        return '🌐 SaaS Admin';
    }
  }

  Color _getRoleColor(UserRole role) {
    switch (role) {
      case UserRole.resident:
        return AppTheme.primaryNavy;
      case UserRole.guard:
        return const Color(0xFFD97706);
      case UserRole.chairman:
        return const Color(0xFF7C3AED);
      case UserRole.committee:
        return const Color(0xFF0284C7);
      case UserRole.accountant:
        return AppTheme.accentTeal;
      case UserRole.admin:
        return const Color(0xFFDC2626);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final activeUser = state.activeUser;

    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 8),
            width: 48,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryNavy.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.manage_accounts_rounded, color: AppTheme.primaryNavy, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'User Profiles & Roles',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkSlate),
                      ),
                      Text(
                        'Manage fresh users in Serverpod & PostgreSQL',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Active User Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppTheme.primaryNavy, Color(0xFF1E3A8A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryNavy.withValues(alpha: 0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.white,
                            child: Text(
                              state.currentUserName.isNotEmpty ? state.currentUserName[0].toUpperCase() : 'U',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryNavy,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        state.currentUserName,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: AppTheme.accentTeal,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Text(
                                        'ACTIVE',
                                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Flat: ${state.currentFlat} • ${activeUser?.phone ?? "9822011223"}',
                                  style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 13),
                                ),
                                Text(
                                  activeUser?.email ?? 'user@samarth.in',
                                  style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.badge_outlined, color: Colors.white, size: 16),
                            const SizedBox(width: 6),
                            Text(
                              'Current Role: ${_getRoleDisplayName(state.currentRole)}',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Quick Role Switcher
                const Text(
                  'Quick Role Switcher (Simulate Persona)',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppTheme.darkSlate),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    UserRole.resident,
                    UserRole.guard,
                    UserRole.chairman,
                    UserRole.accountant,
                    UserRole.admin,
                  ].map((role) {
                    final isSelected = state.currentRole == role;
                    return ChoiceChip(
                      label: Text(_getRoleDisplayName(role)),
                      selected: isSelected,
                      selectedColor: _getRoleColor(role).withValues(alpha: 0.2),
                      labelStyle: TextStyle(
                        color: isSelected ? _getRoleColor(role) : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 12,
                      ),
                      onSelected: (selected) {
                        if (selected) {
                          state.setRole(role);
                        }
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 20),

                // Button: Register New Fresh User
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showCreateUserDialog(context, state);
                    },
                    icon: const Icon(Icons.person_add_alt_1_rounded, color: Colors.white),
                    label: const Text(
                      'Register New Fresh User',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.accentTeal,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Registered Users Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Registered Society Users (${state.users.length})',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.darkSlate),
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh, size: 20),
                      tooltip: 'Refresh Users',
                      onPressed: () => state.refreshUsers(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                if (state.users.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'No registered users loaded yet. Tap refresh or add a user.',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ),
                  )
                else
                  ...state.users.map((user) {
                    final isCurrent = state.activeUser?.id == user.id ||
                        (state.activeUser == null && state.currentUserName == user.fullName);

                    return Card(
                      elevation: isCurrent ? 2 : 0,
                      margin: const EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: isCurrent ? AppTheme.accentTeal : Colors.grey.shade200,
                          width: isCurrent ? 1.8 : 1,
                        ),
                      ),
                      color: isCurrent ? AppTheme.accentTeal.withValues(alpha: 0.05) : Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: _getRoleColor(user.role).withValues(alpha: 0.15),
                          child: Text(
                            user.fullName.isNotEmpty ? user.fullName[0].toUpperCase() : 'U',
                            style: TextStyle(
                              color: _getRoleColor(user.role),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          user.fullName,
                          style: TextStyle(
                            fontWeight: isCurrent ? FontWeight.bold : FontWeight.w600,
                            color: isCurrent ? AppTheme.primaryNavy : AppTheme.darkSlate,
                          ),
                        ),
                        subtitle: Text(
                          '${user.flatNumber != null && user.flatNumber!.isNotEmpty ? "Flat ${user.flatNumber} • " : ""}${user.phone} • ${_getRoleDisplayName(user.role)}',
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        ),
                        trailing: isCurrent
                            ? const Icon(Icons.check_circle, color: AppTheme.accentTeal, size: 24)
                            : OutlinedButton(
                                onPressed: () {
                                  state.setActiveUser(user);
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Switched profile to ${user.fullName} (${user.role.name})'),
                                      backgroundColor: AppTheme.primaryNavy,
                                      behavior: SnackBarBehavior.floating,
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  side: BorderSide(color: Colors.grey.shade300),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: const Text('Switch', style: TextStyle(fontSize: 12)),
                              ),
                        onTap: () {
                          state.setActiveUser(user);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Switched profile to ${user.fullName} (${user.role.name})'),
                              backgroundColor: AppTheme.primaryNavy,
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    );
                  }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showCreateUserDialog(BuildContext context, SocietyState state) {
  showDialog(
    context: context,
    builder: (ctx) => _CreateUserDialog(state: state),
  );
}

class _CreateUserDialog extends StatefulWidget {
  final SocietyState state;
  const _CreateUserDialog({required this.state});

  @override
  State<_CreateUserDialog> createState() => _CreateUserDialogState();
}

class _CreateUserDialogState extends State<_CreateUserDialog> {
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
        flatNumber: _flatController.text.trim().isNotEmpty ? _flatController.text.trim() : null,
        makeActive: _makeActive,
      );

      if (user != null && mounted) {
        Navigator.pop(context); // close dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('🎉 Fresh user "${user.fullName}" registered in PostgreSQL and activated!'),
            backgroundColor: AppTheme.successGreen,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        setState(() {
          _errorMessage = 'Failed to create user. Please check server logs.';
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
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.accentTeal.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.person_add_alt_1_rounded, color: AppTheme.accentTeal, size: 24),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register Fresh User',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkSlate),
                        ),
                        Text(
                          'Saves to PostgreSQL via Serverpod',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              if (_errorMessage != null) ...[
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.dangerRed.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.dangerRed.withValues(alpha: 0.4)),
                  ),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: AppTheme.dangerRed, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 14),
              ],

              // Full Name
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name *',
                  hintText: 'e.g. Ramesh Kadam',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return 'Please enter full name';
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Phone Number
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile Number *',
                  hintText: 'e.g. 9822334455',
                  prefixIcon: const Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return 'Please enter mobile number';
                  if (val.trim().length < 8) return 'Enter a valid mobile number';
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Email Address
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email Address *',
                  hintText: 'e.g. ramesh@samarth.in',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return 'Please enter email address';
                  if (!val.contains('@')) return 'Enter a valid email';
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Role Selector Dropdown
              DropdownButtonFormField<UserRole>(
                initialValue: _selectedRole,
                decoration: InputDecoration(
                  labelText: 'User Role *',
                  prefixIcon: const Icon(Icons.badge_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                items: const [
                  DropdownMenuItem(
                    value: UserRole.resident,
                    child: Text('🏠 Resident (Flat Owner / Tenant)'),
                  ),
                  DropdownMenuItem(
                    value: UserRole.guard,
                    child: Text('🛡️ Security Guard'),
                  ),
                  DropdownMenuItem(
                    value: UserRole.chairman,
                    child: Text('🏛️ Chairman / Committee'),
                  ),
                  DropdownMenuItem(
                    value: UserRole.accountant,
                    child: Text('📊 Accountant (Ledger)'),
                  ),
                  DropdownMenuItem(
                    value: UserRole.admin,
                    child: Text('🌐 SaaS Super Admin'),
                  ),
                ],
                onChanged: (role) {
                  if (role != null) {
                    setState(() => _selectedRole = role);
                  }
                },
              ),
              const SizedBox(height: 14),

              // Flat Number
              TextFormField(
                controller: _flatController,
                decoration: InputDecoration(
                  labelText: _selectedRole == UserRole.resident ? 'Flat Number *' : 'Flat Number (Optional)',
                  hintText: 'e.g. B-402',
                  prefixIcon: const Icon(Icons.home_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (val) {
                  if (_selectedRole == UserRole.resident && (val == null || val.trim().isEmpty)) {
                    return 'Flat number is required for residents';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Make Active Checkbox
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: _makeActive,
                title: const Text('Switch to this new user immediately', style: TextStyle(fontSize: 13)),
                activeColor: AppTheme.accentTeal,
                onChanged: (val) {
                  setState(() => _makeActive = val ?? true);
                },
              ),
              const SizedBox(height: 16),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isSubmitting ? null : () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _isSubmitting ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.accentTeal,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: _isSubmitting
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : const Text(
                            'Save & Activate',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
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
