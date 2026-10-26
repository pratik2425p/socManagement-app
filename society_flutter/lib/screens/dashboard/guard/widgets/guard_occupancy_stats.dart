import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Live Campus Occupancy and Action Bar for Guards
class GuardOccupancyStats extends StatelessWidget {
  final SocietyState state;
  final VoidCallback onNewVisitor;

  const GuardOccupancyStats({
    super.key,
    required this.state,
    required this.onNewVisitor,
  });

  @override
  Widget build(BuildContext context) {
    final visitors = state.visitors;
    final insideCount = visitors.where((v) => v.status == VisitorStatus.inside).length;
    final waitingCount = visitors.where((v) => v.status == VisitorStatus.waitingApproval).length;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppCard(
                padding: AppSpacing.insetAllMd,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('INSIDE CAMPUS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                        Icon(Icons.directions_walk_rounded, color: AppColors.success, size: 18),
                      ],
                    ),
                    AppSpacing.vGapSm,
                    AnimatedCountUp(
                      endValue: insideCount,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.success),
                    ),
                    const SizedBox(height: 2),
                    const Text('Active on campus', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            AppSpacing.hGapMd,
            Expanded(
              child: AppCard(
                padding: AppSpacing.insetAllMd,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('WAITING APPROVAL', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                        Icon(Icons.hourglass_top_rounded, color: AppColors.warning, size: 18),
                      ],
                    ),
                    AppSpacing.vGapSm,
                    AnimatedCountUp(
                      endValue: waitingCount,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.warningDark),
                    ),
                    const SizedBox(height: 2),
                    const Text('Resident gate bell', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ),
        AppSpacing.vGapLg,
        AppButton.primary(
          label: 'Register Walk-In Visitor / Cab',
          icon: Icons.person_add_rounded,
          isFullWidth: true,
          onPressed: onNewVisitor,
        ),
      ],
    );
  }
}
