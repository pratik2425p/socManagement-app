import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

void showNocCertificateModal(BuildContext context, SocietyState state, TenantNoc noc) {
  AppBottomSheet.show(
    context: context,
    title: '📜 Society Tenancy NOC',
    subtitle: noc.nocNumber,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCard(
          color: const Color(0xFFF8FAFC),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text('SHREE SAMARTH CHS LTD.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              const Center(
                child: Text('NO OBJECTION CERTIFICATE (TENANT)', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ),
              const Divider(height: 24),
              Text('Flat Number: ${noc.flatNumber}', style: const TextStyle(fontWeight: FontWeight.w600)),
              Text('Registered Owner: ${noc.ownerName}'),
              Text('Tenant Name: ${noc.tenantName}'),
              Text('Lease Validity: ${noc.leaseStart.day}/${noc.leaseStart.month}/${noc.leaseStart.year} to ${noc.leaseEnd.day}/${noc.leaseEnd.month}/${noc.leaseEnd.year}'),
              Text('Monthly Agreed Rent: ₹${noc.monthlyRent.toStringAsFixed(0)}'),
              if (noc.documentPath != null) ...[
                const Divider(height: 24),
                Row(
                  children: [
                    const Icon(Icons.attach_file_rounded, size: 18, color: AppColors.accentTeal),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Attached Lease / Police Verification',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    AppButton.text(
                      label: 'View Document',
                      height: 32,
                      onPressed: () async {
                        try {
                          final url = await state.client.document.getDownloadUrl(storagePath: noc.documentPath);
                          final uri = Uri.tryParse(url);
                          if (uri != null) {
                            await launchUrl(uri, mode: LaunchMode.externalApplication);
                          }
                        } catch (e) {
                          if (context.mounted) {
                            AppSnackbar.showError(context, 'Could not access document: $e');
                          }
                        }
                      },
                    ),
                  ],
                ),
              ],
              const Divider(height: 24),
              const Text(
                'The society committee confirms receipt of tenant police verification and issues this official NOC.',
                style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        AppSpacing.vGapLg,
        AppButton.primary(
          label: 'Done',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
