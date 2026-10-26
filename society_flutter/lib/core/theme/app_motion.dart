import 'package:flutter/material.dart';

/// Motion System Tokens for Society Management SaaS UI.
/// Provides standardized durations, animation curves, and reduced-motion fallbacks.
class AppMotion {
  AppMotion._();

  // Durations
  static const Duration instant = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration base = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 400);
  static const Duration hero = Duration(milliseconds: 600);

  // Stagger step for list animations
  static const Duration staggerStep = Duration(milliseconds: 40);

  // Curves
  static const Curve emphasized = Cubic(0.2, 0.0, 0.0, 1.0);
  static const Curve standard = Curves.easeInOutCubic;
  static const Curve decelerate = Curves.easeOutCubic;
  static const Curve spring = _DampedSpringCurve();
}

/// A smooth, high-end damped spring curve suitable for modern tactile UI elements.
class _DampedSpringCurve extends Curve {
  const _DampedSpringCurve();

  @override
  double transformInternal(double t) {
    if (t == 0.0 || t == 1.0) return t;
    // Damped harmonic oscillation curve
    final val = 1.0 - (1.0 - t) * (1.0 - t) * (1.0 - t) + 0.04 * (1.0 - t) * t * 3;
    return val.clamp(0.0, 1.0);
  }
}

/// Extension on [BuildContext] for responsive motion and accessibility support.
extension MotionContextX on BuildContext {
  /// Returns false if the OS or user requested reduced motion or disabled animations.
  bool get motionEnabled {
    final mediaQuery = MediaQuery.maybeOf(this);
    if (mediaQuery == null) return true;
    return !mediaQuery.disableAnimations;
  }

  /// Scales animation duration based on whether motion is enabled.
  Duration motionDuration(Duration duration) {
    return motionEnabled ? duration : Duration.zero;
  }
}

/// Subtle fade & slide page transition builder for SaaS desktop and mobile.
class SubtleFadeSlidePageTransitionBuilder extends PageTransitionsBuilder {
  const SubtleFadeSlidePageTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (!context.motionEnabled) {
      return FadeTransition(opacity: animation, child: child);
    }

    final curved = CurvedAnimation(
      parent: animation,
      curve: AppMotion.decelerate,
      reverseCurve: Curves.easeInCubic,
    );

    final slide = Tween<Offset>(
      begin: const Offset(0.0, 0.04),
      end: Offset.zero,
    ).animate(curved);

    return SlideTransition(
      position: slide,
      child: FadeTransition(
        opacity: curved,
        child: child,
      ),
    );
  }
}
