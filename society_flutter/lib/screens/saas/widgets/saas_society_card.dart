import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../core/core.dart';
import '../../onboarding/society_setup_wizard_screen.dart';
import '../../../services/society_state.dart';

class SaasSocietyCard extends StatelessWidget {
  final Society society;
  final bool isCurrent;
  final SocietyState state;

  const SaasSocietyCard({
    super.key,
    required this.society,
    required this.isCurrent,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppCard(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      borderColor: isCurrent
          ? AppColors.primaryNavy
          : (isDark ? AppColors.borderDark : AppColors.borderLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primaryNavy.withValues(alpha: isDark ? 0.3 : 0.12),
                child: Text(
                  society.code,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryNavy,
                    fontSize: 13,
                  ),
                ),
              ),
              AppSpacing.hGapMd,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      society.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppSpacing.vGapXs,
                    Text(
                      '${society.address}, ${society.city} - ${society.pincode}',
                      style: TextStyle(
                        fontSize: 11,
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              AppSpacing.hGapSm,
              AppStatusChip.info(
                label: society.subscriptionPlan.split(' ').first.toUpperCase(),
              ),
            ],
          ),
          AppSpacing.vGapMd,
          Divider(
            height: 1,
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
          AppSpacing.vGapSm,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${society.totalFlats} Flats',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  AppButton(
                    label: 'Setup Wizard',
                    icon: Icons.settings_suggest_rounded,
                    variant: AppButtonVariant.outline,
                    height: 36.0,
                    onPressed: () {
                      state.switchSociety(society);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => SocietySetupWizardScreen(state: state),
                        ),
                      );
                    },
                  ),
                  AppSpacing.hGapSm,
                  AppButton(
                    label: isCurrent ? 'Active Context' : 'Select',
                    variant: isCurrent ? AppButtonVariant.secondary : AppButtonVariant.primary,
                    height: 36.0,
                    onPressed: () {
                      state.switchSociety(society);
                      AppSnackbar.showSuccess(
                        context,
                        'Switched to "${society.name}" workspace',
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
