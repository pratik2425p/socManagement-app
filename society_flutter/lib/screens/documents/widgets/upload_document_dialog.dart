import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../core/core.dart';
import '../../../services/society_state.dart';

class UploadDocumentDialog extends StatefulWidget {
  final SocietyState state;

  const UploadDocumentDialog({super.key, required this.state});

  static Future<void> show(BuildContext context, SocietyState state) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => UploadDocumentDialog(state: state),
    );
  }

  @override
  State<UploadDocumentDialog> createState() => _UploadDocumentDialogState();
}

class _UploadDocumentDialogState extends State<UploadDocumentDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  DocumentCategory _category = DocumentCategory.byeLaws;
  bool _isConfidential = false;

  String? _fileName;
  Uint8List? _fileBytes;
  bool _isUploading = false;
  double _uploadProgress = 0.0;
  String _uploadStatus = '';

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
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
          AppSnackbar.showError(context, 'File size exceeds 10MB limit.');
          return;
        }

        final bytes = file.bytes;
        if (bytes == null || bytes.isEmpty) {
          if (!mounted) return;
          AppSnackbar.showError(context, 'Could not read file data.');
          return;
        }

        setState(() {
          _fileName = file.name;
          _fileBytes = bytes;
          if (_titleCtrl.text.isEmpty) {
            _titleCtrl.text = file.name.replaceAll(RegExp(r'\.[^.]+$'), '');
          }
        });
      }
    } catch (e) {
      if (!mounted) return;
      AppSnackbar.showError(context, 'Error selecting file: $e');
    }
  }

  Future<void> _startUpload() async {
    if (!_formKey.currentState!.validate()) return;
    if (_fileBytes == null || _fileName == null) {
      AppSnackbar.showWarning(context, 'Please select a document file to upload.');
      return;
    }

    setState(() {
      _isUploading = true;
      _uploadProgress = 0.05;
      _uploadStatus = 'Initializing secure upload...';
    });

    try {
      await widget.state.uploadDocumentWithFile(
        title: _titleCtrl.text.trim(),
        description: _descCtrl.text.trim(),
        category: _category,
        isCommitteeOnly: _isConfidential,
        fileName: _fileName!,
        fileBytes: _fileBytes!,
        onProgress: (progress, status) {
          if (mounted) {
            setState(() {
              _uploadProgress = progress;
              _uploadStatus = status;
            });
          }
        },
      );

      if (!mounted) return;
      Navigator.pop(context);
      AppSnackbar.showSuccess(context, 'Document uploaded to Vault successfully!');
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isUploading = false;
        _uploadProgress = 0.0;
        _uploadStatus = '';
      });
      AppSnackbar.showError(context, 'Upload failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Upload Official Society Document', style: TextStyle(fontSize: 16)),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                controller: _titleCtrl,
                label: 'Document Title *',
                hint: 'e.g. FY 2025-26 Statutory Audit Report',
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter a title' : null,
              ),
              AppSpacing.vGapMd,
              AppTextField(
                controller: _descCtrl,
                label: 'Summary / Description *',
                hint: 'e.g. Conducted by M/s R.K. Joshi & Associates, CA',
                maxLines: 2,
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter a summary' : null,
              ),
              AppSpacing.vGapMd,
              const Text('Document Category *', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              AppSpacing.vGapXs,
              DropdownButtonFormField<DocumentCategory>(
                initialValue: _category,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  border: OutlineInputBorder(borderRadius: AppRadii.borderMd),
                ),
                items: DocumentCategory.values.map((c) {
                  return DropdownMenuItem(value: c, child: Text(c.name));
                }).toList(),
                onChanged: _isUploading ? null : (v) {
                  if (v != null) setState(() => _category = v);
                },
              ),
              AppSpacing.vGapSm,
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: _isConfidential,
                title: const Text('Confidential (Committee Only)', style: TextStyle(fontSize: 13)),
                activeColor: AppColors.accentTeal,
                onChanged: _isUploading ? null : (v) => setState(() => _isConfidential = v ?? false),
              ),
              AppSpacing.vGapSm,
              const Text('Attachment (PDF, JPG, PNG - Max 10MB) *',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              AppSpacing.vGapXs,
              InkWell(
                onTap: _isUploading ? null : _pickFile,
                borderRadius: AppRadii.borderMd,
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: _fileName != null ? AppColors.surface(context) : const Color(0xFFF8FAFC),
                    border: Border.all(
                      color: _fileName != null ? AppColors.accentTeal : Colors.grey.shade300,
                      width: 1.5,
                    ),
                    borderRadius: AppRadii.borderMd,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _fileName != null ? Icons.check_circle_rounded : Icons.upload_file_rounded,
                        color: _fileName != null ? AppColors.accentTeal : Colors.grey.shade600,
                      ),
                      AppSpacing.hGapMd,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _fileName ?? 'Tap to select document file',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: _fileName != null ? FontWeight.bold : FontWeight.normal,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (_fileBytes != null)
                              Text(
                                SocietyState.formatFileSize(_fileBytes!.lengthInBytes),
                                style: const TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_isUploading) ...[
                AppSpacing.vGapLg,
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
            ],
          ),
        ),
      ),
      actions: [
        if (!_isUploading)
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ElevatedButton(
          onPressed: _isUploading ? null : _startUpload,
          child: _isUploading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
              : const Text('Upload to Vault'),
        ),
      ],
    );
  }
}
