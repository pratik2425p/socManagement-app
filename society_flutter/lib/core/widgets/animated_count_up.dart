import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/app_motion.dart';

/// Smooth animating number counter for KPIs, revenue metrics, and invoice amounts.
/// Supports Indian currency formatting (₹1,23,456.00) and integers with custom styling.
class AnimatedCountUp extends StatelessWidget {
  final num endValue;
  final num beginValue;
  final Duration duration;
  final Curve curve;
  final String? prefix;
  final String? suffix;
  final int decimalPlaces;
  final bool formatIndianRupees;
  final TextStyle? style;

  const AnimatedCountUp({
    super.key,
    required this.endValue,
    this.beginValue = 0,
    this.duration = AppMotion.slow,
    this.curve = AppMotion.standard,
    this.prefix,
    this.suffix,
    this.decimalPlaces = 0,
    this.formatIndianRupees = false,
    this.style,
  });

  /// Specialized constructor for Indian Rupee amounts.
  const AnimatedCountUp.currency({
    super.key,
    required this.endValue,
    this.beginValue = 0,
    this.duration = AppMotion.slow,
    this.curve = AppMotion.standard,
    this.prefix = '₹',
    this.suffix,
    this.decimalPlaces = 2,
    this.style,
  }) : formatIndianRupees = true;

  String _formatValue(num val) {
    if (formatIndianRupees) {
      final formatter = NumberFormat.currency(
        locale: 'en_IN',
        symbol: prefix ?? '₹',
        decimalDigits: decimalPlaces,
      );
      final formatted = formatter.format(val);
      return suffix != null ? '$formatted$suffix' : formatted;
    }

    String numStr;
    if (decimalPlaces == 0) {
      numStr = val.round().toString();
    } else {
      numStr = val.toStringAsFixed(decimalPlaces);
    }

    final p = prefix ?? '';
    final s = suffix ?? '';
    return '$p$numStr$s';
  }

  @override
  Widget build(BuildContext context) {
    if (!context.motionEnabled) {
      return Text(
        _formatValue(endValue),
        style: style,
      );
    }

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: beginValue.toDouble(), end: endValue.toDouble()),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Text(
          _formatValue(value),
          style: style,
        );
      },
    );
  }
}
