import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_motion.dart';

/// Lightweight Sparkline trend chart for KPI tiles and financial dashboards.
/// Built using high-performance [CustomPainter] without bulky external charting dependencies.
class SparklineChart extends StatelessWidget {
  final List<double> data;
  final Color lineColor;
  final Color? fillColor;
  final double strokeWidth;
  final double height;
  final double? width;
  final bool showFill;

  const SparklineChart({
    super.key,
    required this.data,
    this.lineColor = AppColors.accentTeal,
    this.fillColor,
    this.strokeWidth = 2.0,
    this.height = 36.0,
    this.width,
    this.showFill = true,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return SizedBox(height: height, width: width);

    final fColor = fillColor ?? lineColor.withValues(alpha: 0.15);

    if (!context.motionEnabled) {
      return SizedBox(
        height: height,
        width: width,
        child: CustomPaint(
          size: Size(width ?? double.infinity, height),
          painter: _SparklinePainter(
            data: data,
            lineColor: lineColor,
            fillColor: fColor,
            strokeWidth: strokeWidth,
            showFill: showFill,
            progress: 1.0,
          ),
        ),
      );
    }

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: AppMotion.slow,
      curve: AppMotion.decelerate,
      builder: (context, progress, child) {
        return SizedBox(
          height: height,
          width: width,
          child: CustomPaint(
            size: Size(width ?? double.infinity, height),
            painter: _SparklinePainter(
              data: data,
              lineColor: lineColor,
              fillColor: fColor,
              strokeWidth: strokeWidth,
              showFill: showFill,
              progress: progress,
            ),
          ),
        );
      },
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> data;
  final Color lineColor;
  final Color fillColor;
  final double strokeWidth;
  final bool showFill;
  final double progress;

  _SparklinePainter({
    required this.data,
    required this.lineColor,
    required this.fillColor,
    required this.strokeWidth,
    required this.showFill,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.length < 2) return;

    final minVal = data.reduce((a, b) => a < b ? a : b);
    final maxVal = data.reduce((a, b) => a > b ? a : b);
    final range = (maxVal - minVal) == 0 ? 1.0 : (maxVal - minVal);

    final pointCount = (data.length * progress).clamp(2, data.length).toInt();
    final stepX = size.width / (data.length - 1);

    final path = Path();
    final fillPath = Path();

    for (int i = 0; i < pointCount; i++) {
      final x = i * stepX;
      final normalized = (data[i] - minVal) / range;
      // Invert Y so highest value is at top with padding
      final y = size.height - (normalized * (size.height - strokeWidth * 2)) - strokeWidth;

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }

    if (showFill && pointCount > 1) {
      final lastX = (pointCount - 1) * stepX;
      fillPath.lineTo(lastX, size.height);
      fillPath.close();

      final fillPaint = Paint()
        ..color = fillColor
        ..style = PaintingStyle.fill;
      canvas.drawPath(fillPath, fillPaint);
    }

    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.fillColor != fillColor;
  }
}
