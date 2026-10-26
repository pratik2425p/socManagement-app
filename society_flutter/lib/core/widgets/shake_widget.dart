import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_motion.dart';

/// Gentle horizontal shake animation for error states and failed validation.
class ShakeWidget extends StatefulWidget {
  final Widget child;
  final bool shake;
  final double offset;
  final Duration duration;

  const ShakeWidget({
    super.key,
    required this.child,
    required this.shake,
    this.offset = 8.0,
    this.duration = const Duration(milliseconds: 350),
  });

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    if (widget.shake) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void didUpdateWidget(ShakeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shake && !oldWidget.shake) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!context.motionEnabled) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final val = _controller.value;
        final dx = math.sin(val * math.pi * 6) * widget.offset * (1.0 - val);
        return Transform.translate(
          offset: Offset(dx, 0),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
