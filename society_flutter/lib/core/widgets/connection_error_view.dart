import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../services/society_state.dart';
import '../theme/app_colors.dart';
import '../theme/app_radii.dart';
import '../theme/app_spacing.dart';
import 'app_button.dart';
import 'app_card.dart';

/// Friendly connection error state with retry.
/// Shown when DEMO_MODE=false and the backend server is unreachable.
class ConnectionErrorView extends StatefulWidget {
  final SocietyState state;

  const ConnectionErrorView({super.key, required this.state});

  @override
  State<ConnectionErrorView> createState() => _ConnectionErrorViewState();
}

class _ConnectionErrorViewState extends State<ConnectionErrorView> {
  bool _isRetrying = false;

  Future<void> _handleRetry() async {
    setState(() => _isRetrying = true);
    await widget.state.retryConnection();
    if (mounted) setState(() => _isRetrying = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: AppCard(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.error.withValues(alpha: 0.15)
                          : const Color(0xFFFFF1F2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.cloud_off_rounded,
                      size: 38,
                      color: AppColors.error,
                    ),
                  ),
                  AppSpacing.vGapLg,
                  Text(
                    'Server Unreachable',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.vGapSm,
                  Text(
                    widget.state.connectionErrorMessage ??
                        'Could not establish a connection to the Serverpod backend. Please check your network or verify the server is running on port 8080.',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.vGapLg,
                  if (!kReleaseMode) ...[
                    AppButton.primary(
                      label: 'Continue in Offline Demo Mode',
                      icon: Icons.play_circle_fill_rounded,
                      isFullWidth: true,
                      onPressed: () => widget.state.enableDemoMode(),
                    ),
                    AppSpacing.vGapSm,
                    AppButton.outline(
                      label: 'Retry Server Connection',
                      icon: Icons.refresh_rounded,
                      isFullWidth: true,
                      isLoading: _isRetrying,
                      onPressed: _isRetrying ? null : _handleRetry,
                    ),
                  ] else ...[
                    AppButton.primary(
                      label: 'Retry Connection',
                      icon: Icons.refresh_rounded,
                      isFullWidth: true,
                      isLoading: _isRetrying,
                      onPressed: _isRetrying ? null : _handleRetry,
                    ),
                  ],
                  AppSpacing.vGapLg,
                  Container(
                    padding: AppSpacing.insetAllMd,
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.surfaceElevatedDark : const Color(0xFFF8FAFC),
                      borderRadius: AppRadii.borderMd,
                      border: Border.all(
                        color: isDark ? AppColors.borderDark : AppColors.borderLight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.info_outline_rounded, size: 14, color: AppColors.accentTeal),
                            AppSpacing.hGapXs,
                            Text(
                              'How to run SocietyOS:',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        AppSpacing.vGapXs,
                        Text(
                          '• Offline Demo (Recommended): Click the button above or launch with "--dart-define=DEMO_MODE=true" to explore all 5 personas without a server.\n'
                          '• Local Backend: Start Docker and run "dart run bin/main.dart" in society_server.',
                          style: TextStyle(
                            fontSize: 11,
                            height: 1.4,
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
