import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:society_client/society_client.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/core.dart';
import '../../../services/society_state.dart';

class DocumentViewerDialog extends StatefulWidget {
  final SocietyDocument document;
  final SocietyState state;

  const DocumentViewerDialog({
    super.key,
    required this.document,
    required this.state,
  });

  static Future<void> show(BuildContext context, SocietyState state, SocietyDocument doc) {
    return showDialog(
      context: context,
      builder: (_) => DocumentViewerDialog(document: doc, state: state),
    );
  }

  @override
  State<DocumentViewerDialog> createState() => _DocumentViewerDialogState();
}

class _DocumentViewerDialogState extends State<DocumentViewerDialog> {
  bool _isLoading = true;
  String? _downloadUrl;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchUrl();
  }

  Future<void> _fetchUrl() async {
    try {
      final docId = widget.document.id;
      if (docId == null) {
        setState(() {
          _downloadUrl = widget.document.fileUrl;
          _isLoading = false;
        });
        return;
      }
      final url = await widget.state.getDocumentDownloadUrl(docId);
      if (mounted) {
        setState(() {
          _downloadUrl = url;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _openUrl() async {
    if (_downloadUrl == null) return;
    final uri = Uri.tryParse(_downloadUrl!);
    if (uri != null) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _copyUrl() {
    if (_downloadUrl == null) return;
    Clipboard.setData(ClipboardData(text: _downloadUrl!));
    AppSnackbar.showSuccess(context, 'Secure download link copied to clipboard!');
  }

  @override
  Widget build(BuildContext context) {
    final doc = widget.document;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AlertDialog(
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.errorContainer,
              borderRadius: AppRadii.borderSm,
            ),
            child: const Icon(Icons.picture_as_pdf_rounded, color: AppColors.error, size: 24),
          ),
          AppSpacing.hGapMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doc.title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${doc.category.name} • ${doc.fileSize}',
                  style: TextStyle(fontSize: 11, color: AppColors.textSecondary(context)),
                ),
              ],
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(doc.description, style: const TextStyle(fontSize: 13, height: 1.4)),
            AppSpacing.vGapMd,
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: isDark ? AppColors.surfaceElevatedDark : const Color(0xFFF8FAFC),
                borderRadius: AppRadii.borderSm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Uploaded by: ${doc.uploadedByName}', style: const TextStyle(fontSize: 11)),
                  Text(
                    'Uploaded on: ${doc.uploadedAt.day}/${doc.uploadedAt.month}/${doc.uploadedAt.year}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  if (doc.isCommitteeOnly) ...[
                    AppSpacing.vGapXs,
                    const AppStatusChip.warning(label: 'CONFIDENTIAL - COMMITTEE ONLY'),
                  ],
                ],
              ),
            ),
            AppSpacing.vGapLg,
            if (_isLoading) ...[
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              const Text(
                'Generating secure signed access token...',
                style: TextStyle(fontSize: 11, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ] else if (_errorMessage != null) ...[
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.errorContainer,
                  borderRadius: AppRadii.borderSm,
                ),
                child: Text(
                  'Access Denied: $_errorMessage',
                  style: const TextStyle(color: AppColors.error, fontSize: 12),
                ),
              ),
            ] else ...[
              AppButton.primary(
                label: 'Open Document',
                icon: Icons.open_in_new_rounded,
                onPressed: _openUrl,
              ),
              AppSpacing.vGapSm,
              AppButton.secondary(
                label: 'Copy Secure Download Link',
                icon: Icons.copy_rounded,
                onPressed: _copyUrl,
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
