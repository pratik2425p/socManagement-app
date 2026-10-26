import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../core/core.dart';

class SaasMetricsGrid extends StatelessWidget {
  final SaasMetricSummary metrics;

  const SaasMetricsGrid({
    super.key,
    required this.metrics,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 500;
        final cardWidth = isWide
            ? (constraints.maxWidth - (AppSpacing.sm * 3)) / 4
            : (constraints.maxWidth - AppSpacing.sm) / 2;

        return Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            SizedBox(
              width: cardWidth,
              child: AppMetricTile(
                title: 'MRR Revenue',
                value: '₹${metrics.monthlyRecurringRevenue.toInt()}',
                subtitle: 'Monthly recurring',
                icon: Icons.currency_rupee_rounded,
                accentColor: AppColors.success,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: AppMetricTile(
                title: 'Managed Units',
                value: '${metrics.totalManagedFlats}',
                subtitle: 'Active apartments',
                icon: Icons.apartment_rounded,
                accentColor: AppColors.primaryNavy,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: AppMetricTile(
                title: 'Client Societies',
                value: '${metrics.totalSocieties}',
                subtitle: '${metrics.trialSocieties} in trial period',
                icon: Icons.business_rounded,
                accentColor: AppColors.accentTeal,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: const AppMetricTile(
                title: 'Cloud Status',
                value: 'ONLINE',
                subtitle: 'Multi-tenant 99.9% SLA',
                icon: Icons.cloud_done_rounded,
                accentColor: AppColors.info,
              ),
            ),
          ],
        );
      },
    );
  }
}
