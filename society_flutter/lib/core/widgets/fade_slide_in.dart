import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_motion.dart';

/// Staggered Fade and Slide entrance animation for lists, cards, and modal components.
/// Seamlessly disables or collapses to simple fade when reduced motion is preferred.
class FadeSlideIn extends StatefulWidget {
  final Widget child;
  final Duration? delay;
  final Duration duration;
  final Offset beginOffset;
  final Curve curve;

  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay,
    this.duration = AppMotion.base,
    this.beginOffset = const Offset(0, 0.08),
    this.curve = AppMotion.decelerate,
  });

  /// Factory helper for staggered list items by index.
  /// Caps stagger at first 10 items to prevent performance degradation on large lists.
  factory FadeSlideIn.staggered({
    Key? key,
    required int index,
    required Widget child,
    Offset beginOffset = const Offset(0, 0.06),
    Duration baseDuration = AppMotion.base,
  }) {
    final cappedIndex = index.clamp(0, 10);
    return FadeSlideIn(
      key: key,
      delay: Duration(milliseconds: cappedIndex * AppMotion.staggerStep.inMilliseconds),
      duration: baseDuration,
      beginOffset: beginOffset,
      child: child,
    );
  }

  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  Timer? _delayTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _slideAnimation = Tween<Offset>(
      begin: widget.beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    _startAnimation();
  }

  void _startAnimation() {
    if (widget.delay == null || widget.delay == Duration.zero) {
      if (mounted) _controller.forward();
    } else {
      _delayTimer = Timer(widget.delay!, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!context.motionEnabled) {
      return widget.child;
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
