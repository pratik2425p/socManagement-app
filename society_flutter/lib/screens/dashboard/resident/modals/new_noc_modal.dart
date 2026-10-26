import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

void showNewTenantNocModal(BuildContext context, SocietyState state) {
  AppBottomSheet.show(
    context: context,
    title: 'Apply for Tenant Society NOC',
    subtitle: 'Flat ${state.currentFlat} • Official Committee Verification',
    child: NewNocFormContent(state: state),
  );
}

class NewNocFormContent extends StatefulWidget {
  final SocietyState state;
  const NewNocFormContent({super.key, required this.state});

  @override
  State<NewNocFormContent> createState() => _NewNocFormContentState();
}

class _NewNocFormContentState extends State<NewNocFormContent> {
  final _formKey = GlobalKey<FormState>();
  final _tenantNameController = TextEditingController();
  final _tenantPhoneController = TextEditingController();
  final _rentController = TextEditingController();
  bool _isSubmitting = false;

  String? _documentFileName;
  Uint8List? _documentBytes;
  double _uploadProgress = 0.0;
  String _uploadStatus = '';

  @override
  void dispose() {
    _tenantNameController.dispose();
    _tenantPhoneController.dispose();
    _rentController.dispose();
    super.dispose();
  }

  Future<void> _pickDocument() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
        withData: true,
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        if (file.size > 10 * 1024 * 1024) {
          if (!mounted) return;
          AppSnackbar.showError(context, 'Document exceeds 10MB limit.');
          return;
        }

        final bytes = file.bytes;
        if (bytes == null || bytes.isEmpty) {
          if (!mounted) return;
          AppSnackbar.showError(context, 'Could not read document data.');
          return;
        }

        setState(() {
          _documentFileName = file.name;
          _documentBytes = bytes;
        });
      }
    } catch (e) {
      if (!mounted) return;
      AppSnackbar.showError(context, 'Error selecting document: $e');
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isSubmitting = true;
      _uploadProgress = 0.1;
      _uploadStatus = 'Initiating NOC request...';
    });

    final flat = widget.state.currentFlat.isNotEmpty ? widget.state.currentFlat : 'Flat Office';
    final owner = widget.state.currentUserName.isNotEmpty ? widget.state.currentUserName : 'Resident Owner';
    final rent = double.tryParse(_rentController.text.trim()) ?? 22000.0;

    String? storagePath;
    if (_documentBytes != null && _documentFileName != null) {
      try {
        storagePath = await widget.state.uploadNocAttachment(
          fileName: _documentFileName!,
          fileBytes: _documentBytes!,
          onProgress: (p, s) {
            if (mounted) {
              setState(() {
                _uploadProgress = p;
                _uploadStatus = s;
              });
            }
          },
        );
      } catch (e) {
        setState(() => _isSubmitting = false);
        if (!mounted) return;
        AppSnackbar.showError(context, 'Failed to upload document: $e');
        return;
      }
    }

    final noc = await widget.state.issueTenantNoc(
      flatNumber: flat,
      ownerName: owner,
      ownerPhone: '9822011223',
      tenantName: _tenantNameController.text.trim(),
      tenantPhone: _tenantPhoneController.text.trim(),
      leaseStart: DateTime.now(),
      leaseEnd: DateTime.now().add(const Duration(days: 335)),
      monthlyRent: rent,
      documentPath: storagePath,
    );

    setState(() => _isSubmitting = false);

    if (!mounted) return;

    if (noc != null) {
      Navigator.pop(context);
      AppSnackbar.showSuccess(
        context,
        '🎉 Tenant NOC approved and issued for Flat ${widget.state.currentFlat}!',
      );
    } else {
      AppSnackbar.showError(
        context,
        'Failed to issue tenant NOC. Please check connection and try again.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            controller: _tenantNameController,
            label: 'Tenant Full Name *',
            hint: 'e.g. Rahul Sharma',
            prefixIcon: const Icon(Icons.person_outline, size: 20),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter tenant name' : null,
          ),
          AppSpacing.vGapMd,
          AppTextField(
            controller: _tenantPhoneController,
            label: 'Tenant Mobile Number *',
            hint: 'e.g. 9811223344',
            keyboardType: TextInputType.phone,
            prefixIcon: const Icon(Icons.phone_outlined, size: 20),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter tenant phone' : null,
          ),
          AppSpacing.vGapMd,
          AppTextField(
            controller: _rentController,
            label: 'Monthly Rent (₹) *',
            hint: 'e.g. 24000',
            keyboardType: TextInputType.number,
            prefixIcon: const Icon(Icons.currency_rupee, size: 20),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter rent amount' : null,
          ),
          AppSpacing.vGapMd,
          const Text('Attach Agreement / Police Verification (PDF, JPG, PNG - Max 10MB)',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          AppSpacing.vGapXs,
          InkWell(
            onTap: _isSubmitting ? null : _pickDocument,
            borderRadius: AppRadii.borderMd,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: _documentFileName != null ? AppColors.surface(context) : const Color(0xFFF8FAFC),
                border: Border.all(
                  color: _documentFileName != null ? AppColors.accentTeal : Colors.grey.shade300,
                  width: 1.5,
                ),
                borderRadius: AppRadii.borderMd,
              ),
              child: Row(
                children: [
                  Icon(
                    _documentFileName != null ? Icons.check_circle_rounded : Icons.upload_file_rounded,
                    color: _documentFileName != null ? AppColors.accentTeal : Colors.grey.shade600,
                  ),
                  AppSpacing.hGapMd,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _documentFileName ?? 'Tap to attach document (Optional)',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: _documentFileName != null ? FontWeight.bold : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (_documentBytes != null)
                          Text(
                            SocietyState.formatFileSize(_documentBytes!.lengthInBytes),
                            style: const TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isSubmitting) ...[
            AppSpacing.vGapMd,
            LinearProgressIndicator(
              value: _uploadProgress,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accentTeal),
            ),
            AppSpacing.vGapXs,
            Text(
              _uploadStatus,
              style: const TextStyle(fontSize: 11, color: AppColors.accentTeal, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
          AppSpacing.vGapXl,
          AppButton.secondary(
            label: 'Issue Society Tenant NOC',
            isLoading: _isSubmitting,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
