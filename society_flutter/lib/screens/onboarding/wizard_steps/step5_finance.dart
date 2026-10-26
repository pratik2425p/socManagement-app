import 'package:flutter/material.dart';
import '../../../../core/core.dart';

/// Wizard Step 5: Finance & Monthly Maintenance Billing Setup
class Step5Finance extends StatelessWidget {
  final TextEditingController baseAmountController;
  final TextEditingController dueDateController;
  final TextEditingController lateFeeController;

  const Step5Finance({
    super.key,
    required this.baseAmountController,
    required this.dueDateController,
    required this.lateFeeController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(
          title: 'Automated Billing & Tariff Rules',
          subtitle: 'Used by the 24-hr Serverpod BillingScheduler background service',
          padding: EdgeInsets.zero,
        ),
        AppSpacing.vGapMd,
        AppTextField(
          controller: baseAmountController,
          label: 'Default Monthly Maintenance per Flat (₹) *',
          hint: '2450',
          keyboardType: TextInputType.number,
          prefixIcon: const Icon(Icons.currency_rupee, size: 20),
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter base amount' : null,
        ),
        AppSpacing.vGapMd,
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: dueDateController,
                label: 'Due Day of Month *',
                hint: '10',
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.calendar_today_rounded, size: 18),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter day (1-28)' : null,
              ),
            ),
            AppSpacing.hGapMd,
            Expanded(
              child: AppTextField(
                controller: lateFeeController,
                label: 'Late Payment Penalty (₹)',
                hint: '150',
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.warning_amber_rounded, size: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
