import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../core/core.dart';

class SaasSubscriptionCard extends StatelessWidget {
  final SocietySubscription subscription;

  const SaasSubscriptionCard({
    super.key,
    required this.subscription,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isActive = subscription.status.toLowerCase() == 'active';

    return AppCard(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  subscription.societyName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AppSpacing.hGapSm,
              if (isActive)
                const AppStatusChip.success(label: 'ACTIVE')
              else
                AppStatusChip.warning(label: subscription.status.toUpperCase()),
            ],
          ),
          AppSpacing.vGapSm,
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primaryNavy.withValues(alpha: isDark ? 0.25 : 0.1),
                  borderRadius: AppRadii.borderSm,
                ),
                child: Text(
                  subscription.tier.name.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.primaryNavy,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AppSpacing.hGapSm,
              Text(
                '${subscription.flatCount} flats • ₹${subscription.ratePerFlat.toInt()}/flat',
                style: TextStyle(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Text(
                '₹${subscription.monthlyTotal.toInt()}/mo',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.success,
                ),
              ),
            ],
          ),
          AppSpacing.vGapSm,
          Divider(
            height: 1,
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
          AppSpacing.vGapSm,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      size: 13,
                      color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                    ),
                    AppSpacing.hGapXs,
                    Expanded(
                      child: Text(
                        subscription.contactEmail,
                        style: TextStyle(
                          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          fontSize: 11,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Renews: ${subscription.nextRenewalDate.day}/${subscription.nextRenewalDate.month}/${subscription.nextRenewalDate.year}',
                style: TextStyle(
                  color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
