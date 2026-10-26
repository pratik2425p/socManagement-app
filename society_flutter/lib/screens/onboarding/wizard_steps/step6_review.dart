import 'package:flutter/material.dart';
import '../../../../core/core.dart';

/// Wizard Step 6: Review & Final Confirmation
class Step6Review extends StatelessWidget {
  final String societyName;
  final String societyCode;
  final String address;
  final int totalFlats;
  final String guardName;
  final String accountantName;
  final int validMembers;
  final String baseMaintenance;

  const Step6Review({
    super.key,
    required this.societyName,
    required this.societyCode,
    required this.address,
    required this.totalFlats,
    required this.guardName,
    required this.accountantName,
    required this.validMembers,
    required this.baseMaintenance,
  });

  Widget _buildRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context))),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(
          title: 'Review Society Configuration',
          subtitle: 'Verify all parameters before persisting into PostgreSQL database',
          padding: EdgeInsets.zero,
        ),
        AppSpacing.vGapMd,
        AppCard(
          child: Column(
            children: [
              _buildRow(context, 'Society Name', societyName.isNotEmpty ? societyName : 'Samarth CHS'),
              _buildRow(context, 'Registration Code', societyCode.isNotEmpty ? societyCode : 'SAMARTH01'),
              _buildRow(context, 'Address', address.isNotEmpty ? address : 'Sector 14'),
              const Divider(height: 18),
              _buildRow(context, 'Total Flats Configured', '$totalFlats Units'),
              _buildRow(context, 'Primary Security Guard', guardName.isNotEmpty ? guardName : 'Santosh Gawde'),
              _buildRow(context, 'Primary Accountant', accountantName.isNotEmpty ? accountantName : 'Sunil Mehta'),
              _buildRow(context, 'Imported Flat Owners', '$validMembers Contacts'),
              const Divider(height: 18),
              _buildRow(context, 'Monthly Maintenance', '₹$baseMaintenance / flat / mo'),
            ],
          ),
        ),
        AppSpacing.vGapLg,
        Container(
          padding: AppSpacing.insetAllMd,
          decoration: BoxDecoration(
            color: AppColors.successContainer,
            borderRadius: AppRadii.borderMd,
            border: Border.all(color: AppColors.successBorder),
          ),
          child: const Row(
            children: [
              Icon(Icons.check_circle_rounded, color: AppColors.success, size: 22),
              AppSpacing.hGapMd,
              Expanded(
                child: Text(
                  'Finalizing will save the society, generate wings & flats, create staff profiles, and dispatch invitations.',
                  style: TextStyle(fontSize: 12, color: AppColors.successDark),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
