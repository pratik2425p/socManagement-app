import 'package:flutter/material.dart';
import '../../../../core/core.dart';

class CsvRowValidation {
  final String name;
  final String phone;
  final String email;
  final String flat;
  final bool isValid;
  final String? error;

  CsvRowValidation({
    required this.name,
    required this.phone,
    required this.email,
    required this.flat,
    required this.isValid,
    this.error,
  });
}

/// Wizard Step 4: Bulk Flat Owner Import (CSV / Excel format)
class Step4OwnerImport extends StatelessWidget {
  final TextEditingController csvController;
  final List<CsvRowValidation> parsedRows;
  final VoidCallback onParseCsv;
  final VoidCallback onLoadSampleCsv;

  const Step4OwnerImport({
    super.key,
    required this.csvController,
    required this.parsedRows,
    required this.onParseCsv,
    required this.onLoadSampleCsv,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(
          title: 'Bulk Member Import (CSV / Excel)',
          subtitle: 'Format: Name, Phone, Email, Flat Number (one per line)',
          padding: EdgeInsets.zero,
        ),
        AppSpacing.vGapMd,

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppButton.text(
              label: 'Paste Sample Demo Data',
              icon: Icons.content_paste_rounded,
              onPressed: onLoadSampleCsv,
              height: 36,
            ),
          ],
        ),
        AppSpacing.vGapXs,

        AppTextField(
          controller: csvController,
          label: 'Paste CSV Data *',
          hint: 'Vicky Patil,9822011223,vicky@samarth.in,A-304\nRohit Deshmukh,9822011444,rohit@samarth.in,A-201',
          maxLines: 5,
        ),
        AppSpacing.vGapMd,

        AppButton.secondary(
          label: 'Validate & Parse Records',
          icon: Icons.check_circle_outline_rounded,
          onPressed: onParseCsv,
        ),
        AppSpacing.vGapLg,

        if (parsedRows.isNotEmpty) ...[
          AppSectionHeader(
            title: 'Validated Records (${parsedRows.where((r) => r.isValid).length} Valid / ${parsedRows.length} Total)',
            subtitle: 'Invitations will be auto-dispatched to these contacts',
          ),
          AppSpacing.vGapSm,
          ...parsedRows.map((row) {
            return AppCard(
              margin: const EdgeInsets.only(bottom: AppSpacing.xs),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              borderColor: row.isValid ? AppColors.successBorder : AppColors.errorBorder,
              color: row.isValid ? AppColors.successContainer : AppColors.errorContainer,
              child: Row(
                children: [
                  Icon(
                    row.isValid ? Icons.check_circle_rounded : Icons.error_rounded,
                    color: row.isValid ? AppColors.success : AppColors.error,
                    size: 18,
                  ),
                  AppSpacing.hGapMd,
                  Expanded(
                    child: Text(
                      '${row.name} • ${row.phone} • Flat ${row.flat}',
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ),
                  AppStatusChip(
                    label: row.isValid ? 'VALID' : (row.error ?? 'ERROR'),
                    variant: row.isValid ? AppStatusVariant.success : AppStatusVariant.error,
                  ),
                ],
              ),
            );
          }),
        ],
      ],
    );
  }
}
