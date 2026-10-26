import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Full-screen emergency alert modal dialog triggered immediately when an SOS event arrives
class SosAlertDialog {
  static Future<void> show({
    required BuildContext context,
    required SosAlertEvent event,
    required SocietyState state,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => _SosAlertContent(event: event, state: state),
    );
  }
}

class _SosAlertContent extends StatelessWidget {
  final SosAlertEvent event;
  final SocietyState state;

  const _SosAlertContent({
    required this.event,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isGuard = state.currentRole == UserRole.guard;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: AppRadii.borderLg),
      backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.errorContainer,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.emergency_rounded,
                    color: AppColors.error,
                    size: 32,
                  ),
                ),
                AppSpacing.hGapMd,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EMERGENCY SOS',
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: AppColors.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Flat ${event.flatNumber}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppSpacing.vGapMd,
            AppCard(
              color: isDark ? const Color(0xFF0F172A) : const Color(0xFFFFF1F2),
              borderColor: AppColors.errorBorder,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Type: ${event.emergencyType.name.toUpperCase()}',
                        style: const TextStyle(
                          color: AppColors.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AppStatusChip.error(label: 'URGENT'),
                    ],
                  ),
                  AppSpacing.vGapSm,
                  Text(
                    'Raised by: ${event.raisedByName}',
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                  if (event.description != null && event.description!.trim().isNotEmpty) ...[
                    AppSpacing.vGapXs,
                    Text(
                      'Details: "${event.description!}"',
                      style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                  ],
                ],
              ),
            ),
            AppSpacing.vGapLg,
            Row(
              children: [
                Expanded(
                  child: AppButton.outline(
                    label: 'Dismiss',
                    height: 44,
                    onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                  ),
                ),
                if (isGuard) ...[
                  AppSpacing.hGapMd,
                  Expanded(
                    child: AppButton.destructive(
                      label: 'Acknowledge',
                      icon: Icons.check_circle_rounded,
                      height: 44,
                      onPressed: () async {
                        await state.acknowledgeSos(event.alertId, state.currentUserName);
                        if (context.mounted) {
                          Navigator.of(context, rootNavigator: true).pop();
                          AppSnackbar.showSuccess(context, 'SOS acknowledged. Response team deployed.');
                        }
                      },
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
