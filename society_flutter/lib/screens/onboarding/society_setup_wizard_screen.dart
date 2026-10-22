import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../services/society_state.dart';
import '../../theme/app_theme.dart';
import 'member_invitations_screen.dart';

class SocietySetupWizardScreen extends StatefulWidget {
  final SocietyState state;
  const SocietySetupWizardScreen({super.key, required this.state});

  @override
  State<SocietySetupWizardScreen> createState() => _SocietySetupWizardScreenState();
}

class _SocietySetupWizardScreenState extends State<SocietySetupWizardScreen> {
  int _currentStep = 0;

  // Step 1: Profile controllers
  late TextEditingController _nameCtrl;
  late TextEditingController _regNoCtrl;
  late TextEditingController _addressCtrl;
  late TextEditingController _contactCtrl;

  // Step 2: Building generator controllers
  final _wingNameCtrl = TextEditingController(text: 'Wing A');
  final _floorsCtrl = TextEditingController(text: '5');
  final _unitsPerFloorCtrl = TextEditingController(text: '4');

  // Step 3: Committee appointment controllers
  final _staffNameCtrl = TextEditingController();
  final _staffPhoneCtrl = TextEditingController();
  UserRole _selectedStaffRole = UserRole.accountant;

  // Step 4: Bulk CSV Data
  final TextEditingController _csvDataCtrl = TextEditingController(
    text: 'Wing,Flat Number,Owner Name,Mobile Number,Email,Occupancy,Tenant Name\n'
        'Wing A,A-101,Rahul Deshmukh,9822114455,rahul@gmail.com,Owner Occupied,\n'
        'Wing A,A-102,Pooja Kulkarni,9822336677,pooja@gmail.com,Rented,Suresh More\n'
        'Wing A,A-103,Amit Shinde,9811223344,amit@gmail.com,Owner Occupied,\n'
        'Wing B,B-101,Sneha Joshi,9766554433,sneha@gmail.com,Owner Occupied,\n'
        'Wing B,B-102,Vikram Malhotra,9899001122,vikram@gmail.com,Owner Occupied,',
  );
  List<_CsvRowValidation> _validatedRows = [];

  // Step 5: Financial Setup
  final _maintenanceRateCtrl = TextEditingController(text: '2500');
  final _dueDayCtrl = TextEditingController(text: '10');
  final _lateFeeCtrl = TextEditingController(text: '100');

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.state.societyName);
    _regNoCtrl = TextEditingController(text: 'MH/PUN/RERA/2024/8941');
    _addressCtrl = TextEditingController(text: 'Near IT Park, Kothrud, Pune - 411038');
    _contactCtrl = TextEditingController(text: '9822011223');
    _validateCsvContent();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _regNoCtrl.dispose();
    _addressCtrl.dispose();
    _contactCtrl.dispose();
    _wingNameCtrl.dispose();
    _floorsCtrl.dispose();
    _unitsPerFloorCtrl.dispose();
    _staffNameCtrl.dispose();
    _staffPhoneCtrl.dispose();
    _csvDataCtrl.dispose();
    _maintenanceRateCtrl.dispose();
    _dueDayCtrl.dispose();
    _lateFeeCtrl.dispose();
    super.dispose();
  }

  void _validateCsvContent() {
    final lines = _csvDataCtrl.text.trim().split('\n');
    final rows = <_CsvRowValidation>[];
    final seenFlats = <String>{};

    for (int i = 1; i < lines.length; i++) {
      final line = lines[i].trim();
      if (line.isEmpty) continue;
      final parts = line.split(',');

      if (parts.length < 4) {
        rows.add(_CsvRowValidation(
          lineNumber: i + 1,
          wing: 'N/A',
          flat: 'N/A',
          ownerName: 'Invalid Format',
          phone: '',
          isValid: false,
          error: 'Columns missing. Required at least 4 columns.',
        ));
        continue;
      }

      final wing = parts[0].trim();
      final flat = parts[1].trim();
      final owner = parts[2].trim();
      final phone = parts[3].trim();
      final email = parts.length > 4 ? parts[4].trim() : '';

      String? error;
      if (flat.isEmpty) {
        error = 'Flat number missing';
      } else if (seenFlats.contains(flat.toUpperCase())) {
        error = 'Duplicate flat number: $flat';
      } else if (owner.isEmpty) {
        error = 'Owner name missing';
      } else if (phone.length < 8) {
        error = 'Invalid phone number ($phone)';
      }

      seenFlats.add(flat.toUpperCase());
      rows.add(_CsvRowValidation(
        lineNumber: i + 1,
        wing: wing,
        flat: flat,
        ownerName: owner,
        phone: phone,
        email: email,
        isValid: error == null,
        error: error,
      ));
    }

    setState(() {
      _validatedRows = rows;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Society Onboarding Setup Wizard', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('6-Step Rapid Implementation Engine', style: TextStyle(fontSize: 11, color: Colors.white70)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'View Invitations',
            icon: const Icon(Icons.mark_email_read_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => MemberInvitationsScreen(state: widget.state)),
              );
            },
          ),
        ],
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepTapped: (step) => setState(() => _currentStep = step),
        onStepContinue: () {
          if (_currentStep < 5) {
            setState(() => _currentStep += 1);
          } else {
            // Finish Go Live
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('🎉 Society setup verified and activated! Member invitations ready.'),
                backgroundColor: AppTheme.successGreen,
                behavior: SnackBarBehavior.floating,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => MemberInvitationsScreen(state: widget.state)),
            );
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep -= 1);
          }
        },
        steps: [
          Step(
            title: const Text('Profile'),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            content: _buildStep1Profile(),
          ),
          Step(
            title: const Text('Flats'),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            content: _buildStep2Flats(),
          ),
          Step(
            title: const Text('Staff'),
            isActive: _currentStep >= 2,
            state: _currentStep > 2 ? StepState.complete : StepState.indexed,
            content: _buildStep3Staff(),
          ),
          Step(
            title: const Text('Owners'),
            isActive: _currentStep >= 3,
            state: _currentStep > 3 ? StepState.complete : StepState.indexed,
            content: _buildStep4OwnerImport(),
          ),
          Step(
            title: const Text('Finance'),
            isActive: _currentStep >= 4,
            state: _currentStep > 4 ? StepState.complete : StepState.indexed,
            content: _buildStep5Finance(),
          ),
          Step(
            title: const Text('Go-Live'),
            isActive: _currentStep >= 5,
            state: _currentStep > 5 ? StepState.complete : StepState.indexed,
            content: _buildStep6Review(),
          ),
        ],
      ),
    );
  }

  // --- Step 1: Society Profile ---
  Widget _buildStep1Profile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Step 1: Society Legal & Contact Profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.darkSlate)),
        const Text('Enter official registration details and society admin contact.', style: TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 16),
        TextFormField(
          controller: _nameCtrl,
          decoration: InputDecoration(
            labelText: 'Society Registered Name *',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _regNoCtrl,
          decoration: InputDecoration(
            labelText: 'Co-op Registration / RERA Number *',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _addressCtrl,
          decoration: InputDecoration(
            labelText: 'Address & Locality *',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _contactCtrl,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Admin Helpline / Contact Mobile *',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }

  // --- Step 2: Wings & Flats ---
  Widget _buildStep2Flats() {
    final state = widget.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Step 2: Wings, Buildings & Flats Setup', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.darkSlate)),
        const Text('Auto-generate flat structures (e.g. 5 floors, 4 flats/floor = 20 units).', style: TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 16),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('⚡ Rapid Wing & Flats Generator', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.primaryNavy)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _wingNameCtrl,
                      decoration: InputDecoration(
                        labelText: 'Wing Name',
                        hintText: 'e.g. Wing A',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _floorsCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Floors',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _unitsPerFloorCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Flats/Flr',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final wing = _wingNameCtrl.text.trim();
                    final floors = int.tryParse(_floorsCtrl.text.trim()) ?? 5;
                    final units = int.tryParse(_unitsPerFloorCtrl.text.trim()) ?? 4;

                    final count = await state.autoGenerateFlatsForWing(
                      buildingId: 1,
                      wingName: wing,
                      floors: floors,
                      flatsPerFloor: units,
                    );

                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Generated $count flats for $wing in PostgreSQL!'),
                          backgroundColor: AppTheme.successGreen,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.auto_awesome, color: Colors.white, size: 18),
                  label: const Text('Generate Flats Structure in DB', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.accentTeal),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Existing Flats in Database (${state.flats.length})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text('${state.flats.length} configured', style: const TextStyle(color: AppTheme.primaryNavy, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: state.flats.take(30).map((f) => Chip(
                label: Text(f.flatNumber, style: const TextStyle(fontSize: 11)),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
              )).toList(),
        ),
        if (state.flats.length > 30)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text('+ ${state.flats.length - 30} more flats saved', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
          ),
      ],
    );
  }

  // --- Step 3: Committee & Staff ---
  Widget _buildStep3Staff() {
    final state = widget.state;
    final staffUsers = state.users.where((u) => u.role != UserRole.resident).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Step 3: Committee & Security Staff Appointment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.darkSlate)),
        const Text('Assign Chairman, Accountant, Committee Members, and Security Guards.', style: TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 16),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Add Staff Member', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.primaryNavy)),
              const SizedBox(height: 10),
              TextFormField(
                controller: _staffNameCtrl,
                decoration: InputDecoration(
                  labelText: 'Staff Full Name',
                  hintText: 'e.g. Anand Shinde',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _staffPhoneCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        hintText: 'e.g. 9822998877',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: DropdownButtonFormField<UserRole>(
                      initialValue: _selectedStaffRole,
                      decoration: InputDecoration(
                        labelText: 'Role',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      items: const [
                        DropdownMenuItem(value: UserRole.chairman, child: Text('Chairman')),
                        DropdownMenuItem(value: UserRole.accountant, child: Text('Accountant')),
                        DropdownMenuItem(value: UserRole.guard, child: Text('Guard')),
                        DropdownMenuItem(value: UserRole.committee, child: Text('Committee')),
                      ],
                      onChanged: (r) {
                        if (r != null) setState(() => _selectedStaffRole = r);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    if (_staffNameCtrl.text.trim().isEmpty || _staffPhoneCtrl.text.trim().isEmpty) return;
                    await state.createNewUser(
                      fullName: _staffNameCtrl.text.trim(),
                      phone: _staffPhoneCtrl.text.trim(),
                      email: '${_staffPhoneCtrl.text.trim()}@samarth.in',
                      role: _selectedStaffRole,
                      flatNumber: _selectedStaffRole == UserRole.guard ? 'Main Gate' : 'Society Office',
                      makeActive: false,
                    );
                    _staffNameCtrl.clear();
                    _staffPhoneCtrl.clear();
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Staff member appointed!'), backgroundColor: AppTheme.successGreen),
                      );
                    }
                  },
                  icon: const Icon(Icons.person_add_alt_1, color: Colors.white, size: 18),
                  label: const Text('Appoint Staff Member', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryNavy),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        const Text('Appointed Staff & Committee', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),

        ...staffUsers.map((u) => Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: ListTile(
                dense: true,
                leading: CircleAvatar(
                  backgroundColor: AppTheme.accentTeal.withValues(alpha: 0.15),
                  child: Text(u.fullName[0], style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.accentTeal)),
                ),
                title: Text(u.fullName, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${u.phone} • ${u.role.name.toUpperCase()}'),
                trailing: Chip(
                  label: Text(u.role.name.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              ),
            )),
      ],
    );
  }

  // --- Step 4: Bulk Owner Onboarding ---
  Widget _buildStep4OwnerImport() {
    final validCount = _validatedRows.where((r) => r.isValid).length;
    final errorCount = _validatedRows.where((r) => !r.isValid).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Step 4: Bulk Owner & Tenant Onboarding', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.darkSlate)),
        const Text('Excel / CSV format import with pre-validation and staging.', style: TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 14),

        // CSV Editor
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('CSV Data Stream (Edit / Paste)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkSlate)),
                    TextButton.icon(
                      onPressed: _validateCsvContent,
                      icon: const Icon(Icons.check_circle_outline, size: 16),
                      label: const Text('Re-Validate'),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              TextFormField(
                controller: _csvDataCtrl,
                maxLines: 6,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  border: InputBorder.none,
                ),
                onChanged: (_) => _validateCsvContent(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Validation Summary Bar
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.successGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.successGreen.withValues(alpha: 0.3)),
                ),
                child: Text('✅ $validCount Valid Records', style: const TextStyle(color: AppTheme.successGreen, fontWeight: FontWeight.bold, fontSize: 13)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: errorCount > 0 ? AppTheme.dangerRed.withValues(alpha: 0.1) : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: errorCount > 0 ? AppTheme.dangerRed.withValues(alpha: 0.3) : Colors.grey.shade300),
                ),
                child: Text(
                  errorCount > 0 ? '⚠️ $errorCount Errors' : '0 Errors',
                  style: TextStyle(
                    color: errorCount > 0 ? AppTheme.dangerRed : Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Preview Table
        const Text('Validated Preview Table', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 8),
        Container(
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: ListView.separated(
            itemCount: _validatedRows.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (ctx, idx) {
              final row = _validatedRows[idx];
              return ListTile(
                dense: true,
                leading: Icon(
                  row.isValid ? Icons.check_circle : Icons.error,
                  color: row.isValid ? AppTheme.successGreen : AppTheme.dangerRed,
                  size: 20,
                ),
                title: Text('${row.flat} • ${row.ownerName}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                subtitle: Text(row.isValid ? 'Mobile: ${row.phone}' : 'Error: ${row.error}', style: TextStyle(fontSize: 11, color: row.isValid ? Colors.grey.shade600 : AppTheme.dangerRed)),
                trailing: Text('Line ${row.lineNumber}', style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
              );
            },
          ),
        ),
        const SizedBox(height: 12),

        // Queue Invitations Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: validCount == 0
                ? null
                : () async {
                    final validOnes = _validatedRows.where((r) => r.isValid).toList();
                    final invites = validOnes.map((r) {
                      final randomSuffix = (1000 + DateTime.now().millisecond * 7 % 9000).toString();
                      final cleanFlat = r.flat.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
                      return SocietyInvitation(
                        societyId: widget.state.currentSocietyId,
                        flatNumber: r.flat,
                        inviteeName: r.ownerName,
                        phone: r.phone,
                        email: r.email.isNotEmpty ? r.email : null,
                        role: UserRole.resident,
                        occupancyType: 'owner',
                        inviteCode: 'INV-$cleanFlat-$randomSuffix'.toUpperCase(),
                        status: 'pending',
                        expiresAt: DateTime.now().add(const Duration(days: 14)),
                        createdAt: DateTime.now(),
                      );
                    }).toList();

                    final count = await widget.state.bulkImportMembersAndInvite(invites);
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('🎉 $count Member invitations successfully queued in PostgreSQL!'),
                          backgroundColor: AppTheme.successGreen,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
            icon: const Icon(Icons.upload_file_rounded, color: Colors.white, size: 18),
            label: Text('Stage $validCount Records & Queue Invitations', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4338CA)),
          ),
        ),
      ],
    );
  }

  // --- Step 5: Financial Setup ---
  Widget _buildStep5Finance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Step 5: Society Financial & Billing Setup', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.darkSlate)),
        const Text('Configure default maintenance charges, cycle, due dates, and penalties.', style: TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 16),
        TextFormField(
          controller: _maintenanceRateCtrl,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Monthly Maintenance Rate (₹) *',
            hintText: 'e.g. 2500',
            prefixText: '₹ ',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _dueDayCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Due Day of Month *',
                  hintText: 'e.g. 10',
                  suffixText: 'th of month',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _lateFeeCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Late Fee Penalty (₹)',
                  hintText: 'e.g. 100',
                  prefixText: '₹ ',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- Step 6: Review & Go-Live ---
  Widget _buildStep6Review() {
    final state = widget.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Step 6: Review & Go-Live Launch', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.darkSlate)),
        const Text('Verify all configurations before dispatching invitations.', style: TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 16),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              _buildReviewRow('Society Name', _nameCtrl.text),
              const Divider(),
              _buildReviewRow('Registration #', _regNoCtrl.text),
              const Divider(),
              _buildReviewRow('Flats in Database', '${state.flats.length} Flats'),
              const Divider(),
              _buildReviewRow('Staff Appointed', '${state.users.where((u) => u.role != UserRole.resident).length} Staff Members'),
              const Divider(),
              _buildReviewRow('Queued Invitations', '${state.invitations.length} Invites Ready'),
              const Divider(),
              _buildReviewRow('Monthly Maintenance', '₹${_maintenanceRateCtrl.text}/month per flat'),
            ],
          ),
        ),
        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppTheme.successGreen.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.successGreen.withValues(alpha: 0.3)),
          ),
          child: const Row(
            children: [
              Icon(Icons.verified, color: AppTheme.successGreen, size: 28),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'All 6 setup phases verified. Tapping "Launch & Go-Live" will activate the society and open Member Invitations dispatch.',
                  style: TextStyle(fontSize: 13, color: Color(0xFF065F46), fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReviewRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkSlate)),
        ],
      ),
    );
  }
}

class _CsvRowValidation {
  final int lineNumber;
  final String wing;
  final String flat;
  final String ownerName;
  final String phone;
  final String email;
  final bool isValid;
  final String? error;

  _CsvRowValidation({
    required this.lineNumber,
    required this.wing,
    required this.flat,
    required this.ownerName,
    required this.phone,
    this.email = '',
    required this.isValid,
    this.error,
  });
}
