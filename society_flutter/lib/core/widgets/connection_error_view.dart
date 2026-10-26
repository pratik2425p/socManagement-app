import 'package:flutter/material.dart';
import '../../services/society_state.dart';
import '../core.dart';

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
                  AppButton.primary(
                    label: 'Retry Connection',
                    icon: Icons.refresh_rounded,
                    isLoading: _isRetrying,
                    onPressed: _isRetrying ? null : _handleRetry,
                  ),
                  AppSpacing.vGapMd,
                  Text(
                    'Tip: Run with "--dart-define=DEMO_MODE=true" to test all features completely offline without a server.',
                    style: TextStyle(
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                      color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                    ),
                    textAlign: TextAlign.center,
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
