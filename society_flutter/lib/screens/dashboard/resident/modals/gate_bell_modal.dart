import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';

/// Interactive Gate Bell Modal Dialog
/// Triggered whenever a security guard creates a walk-in entry requiring resident approval.
class GateBellModal {
  static Future<void> show({
    required BuildContext context,
    required GateBellEvent event,
    required SocietyState state,
  }) {
    return AppBottomSheet.show(
      context: context,
      title: '🔔 Visitor at Gatehouse',
      subtitle: 'Flat ${event.flatNumber} • Awaiting entry permission',
      child: _GateBellModalContent(event: event, state: state),
    );
  }
}

class _GateBellModalContent extends StatefulWidget {
  final GateBellEvent event;
  final SocietyState state;

  const _GateBellModalContent({
    required this.event,
    required this.state,
  });

  @override
  State<_GateBellModalContent> createState() => _GateBellModalContentState();
}

class _GateBellModalContentState extends State<_GateBellModalContent> {
  bool _isProcessing = false;

  Future<void> _handleAction(bool approve) async {
    setState(() => _isProcessing = true);
    final status = approve ? VisitorStatus.approved : VisitorStatus.rejected;

    await widget.state.updateVisitorStatus(widget.event.visitorId, status);

    if (mounted) {
      Navigator.of(context, rootNavigator: true).pop();
      if (approve) {
        AppSnackbar.showSuccess(
          context,
          'Approved entry for ${widget.event.visitorName}! Guard notified.',
        );
      } else {
        AppSnackbar.showWarning(
          context,
          'Entry denied for ${widget.event.visitorName}.',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCard(
          color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
          borderColor: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppAvatar(
                    name: widget.event.visitorName,
                    radius: 28,
                    backgroundColor: AppColors.primaryNavy,
                  ),
                  AppSpacing.hGapMd,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.event.visitorName,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                          ),
                        ),
                        AppSpacing.vGapXs,
                        AppStatusChip.warning(
                          label: widget.event.purpose.toUpperCase(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppSpacing.vGapMd,
              const Divider(height: 1),
              AppSpacing.vGapMd,
              _buildDetailRow(
                icon: Icons.phone_outlined,
                label: 'Phone Number',
                value: widget.event.visitorPhone,
                isDark: isDark,
              ),
              if (widget.event.vehicleNumber != null &&
                  widget.event.vehicleNumber!.trim().isNotEmpty) ...[
                AppSpacing.vGapSm,
                _buildDetailRow(
                  icon: Icons.directions_car_outlined,
                  label: 'Vehicle Number',
                  value: widget.event.vehicleNumber!,
                  isDark: isDark,
                ),
              ],
              AppSpacing.vGapSm,
              _buildDetailRow(
                icon: Icons.access_time_rounded,
                label: 'Arrival Time',
                value: 'Just now',
                isDark: isDark,
              ),
            ],
          ),
        ),
        AppSpacing.vGapLg,
        Row(
          children: [
            Expanded(
              child: AppButton.outline(
                label: 'Deny Entry',
                icon: Icons.close_rounded,
                height: 48,
                isLoading: _isProcessing,
                onPressed: _isProcessing ? null : () => _handleAction(false),
              ),
            ),
            AppSpacing.hGapMd,
            Expanded(
              child: AppButton.primary(
                label: 'Approve Entry',
                icon: Icons.check_circle_rounded,
                height: 48,
                isLoading: _isProcessing,
                onPressed: _isProcessing ? null : () => _handleAction(true),
              ),
            ),
          ],
        ),
        AppSpacing.vGapSm,
      ],
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    required bool isDark,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
        AppSpacing.hGapSm,
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 13,
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
      ],
    );
  }
}
