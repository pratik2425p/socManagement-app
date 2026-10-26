import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

/// Centralized Responsive Breakpoints and Layout Utilities for Web, Tablet & Mobile
class AppBreakpoints {
  AppBreakpoints._();

  static const double mobileMax = 768.0;
  static const double tabletMax = 1100.0;
  static const double wideNavBreakpoint = 840.0;
  static const double contentMaxWidth = 1240.0;
}

/// Helper extension on BuildContext for quick responsive queries
extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  bool get isMobile => screenWidth < AppBreakpoints.mobileMax;
  bool get isTablet => screenWidth >= AppBreakpoints.mobileMax && screenWidth < AppBreakpoints.tabletMax;
  bool get isDesktop => screenWidth >= AppBreakpoints.tabletMax;
  bool get isWide => screenWidth >= AppBreakpoints.wideNavBreakpoint;
}

/// Responsive Container that bounds content width on Desktop/Web
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry alignment;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.maxWidth = AppBreakpoints.contentMaxWidth,
    this.padding,
    this.alignment = Alignment.topCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: padding != null ? Padding(padding: padding!, child: child) : child,
      ),
    );
  }
}

/// Responsive 2-column or Multi-column row layout (Stacks on mobile, side-by-side on desktop)
class ResponsiveRow extends StatelessWidget {
  final List<Widget> children;
  final List<int>? flex;
  final double spacing;
  final double breakpoint;
  final CrossAxisAlignment crossAxisAlignment;

  const ResponsiveRow({
    super.key,
    required this.children,
    this.flex,
    this.spacing = AppSpacing.lg,
    this.breakpoint = AppBreakpoints.mobileMax,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < breakpoint) {
          return Column(
            crossAxisAlignment: crossAxisAlignment,
            children: [
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i < children.length - 1) SizedBox(height: spacing),
              ],
            ],
          );
        }

        return Row(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            for (int i = 0; i < children.length; i++) ...[
              Expanded(
                flex: flex != null && i < flex!.length ? flex![i] : 1,
                child: children[i],
              ),
              if (i < children.length - 1) SizedBox(width: spacing),
            ],
          ],
        );
      },
    );
  }
}
