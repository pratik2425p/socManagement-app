import 'package:flutter/material.dart';
import '../../../../core/core.dart';

/// Wizard Step 3: Security & Staff Roles Assignment
class Step3Staff extends StatelessWidget {
  final TextEditingController guardNameController;
  final TextEditingController guardPhoneController;
  final TextEditingController accountantNameController;
  final TextEditingController accountantPhoneController;

  const Step3Staff({
    super.key,
    required this.guardNameController,
    required this.guardPhoneController,
    required this.accountantNameController,
    required this.accountantPhoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(
          title: 'Initial Staff & Accounts',
          subtitle: 'Appoint primary security guard and society accountant',
          padding: EdgeInsets.zero,
        ),
        AppSpacing.vGapMd,

        // Security Guard Card
        AppCard(
          color: AppColors.roleGuard.withValues(alpha: 0.08),
          borderColor: AppColors.roleGuard.withValues(alpha: 0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.shield_rounded, color: AppColors.roleGuard, size: 20),
                  AppSpacing.hGapSm,
                  Text(
                    'Primary Security Guard (Main Gate)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.roleGuard),
                  ),
                ],
              ),
              AppSpacing.vGapMd,
              AppTextField(
                controller: guardNameController,
                label: 'Guard Full Name',
                hint: 'e.g. Santosh Gawde',
                prefixIcon: const Icon(Icons.person_outline, size: 20),
              ),
              AppSpacing.vGapMd,
              AppTextField(
                controller: guardPhoneController,
                label: 'Guard Mobile Number',
                hint: 'e.g. 9811223344',
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone_outlined, size: 20),
              ),
            ],
          ),
        ),
        AppSpacing.vGapLg,

        // Accountant Card
        AppCard(
          color: AppColors.roleAccountant.withValues(alpha: 0.08),
          borderColor: AppColors.roleAccountant.withValues(alpha: 0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.account_balance_rounded, color: AppColors.roleAccountant, size: 20),
                  AppSpacing.hGapSm,
                  Text(
                    'Primary Society Accountant (Sole Ledger Writer)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.roleAccountant),
                  ),
                ],
              ),
              AppSpacing.vGapMd,
              AppTextField(
                controller: accountantNameController,
                label: 'Accountant Full Name',
                hint: 'e.g. Sunil Mehta',
                prefixIcon: const Icon(Icons.person_outline, size: 20),
              ),
              AppSpacing.vGapMd,
              AppTextField(
                controller: accountantPhoneController,
                label: 'Accountant Mobile Number',
                hint: 'e.g. 9765443322',
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone_outlined, size: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
