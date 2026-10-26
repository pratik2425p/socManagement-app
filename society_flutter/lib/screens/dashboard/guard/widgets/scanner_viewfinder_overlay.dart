import 'package:flutter/material.dart';
import '../../../../core/core.dart';

/// Custom viewfinder overlay with semi-transparent backdrop, corner brackets,
/// and smooth vertical sweeping laser line.
class ScannerViewfinderOverlay extends StatefulWidget {
  final double scanBoxSize;

  const ScannerViewfinderOverlay({
    super.key,
    this.scanBoxSize = 260.0,
  });

  @override
  State<ScannerViewfinderOverlay> createState() => _ScannerViewfinderOverlayState();
}

class _ScannerViewfinderOverlayState extends State<ScannerViewfinderOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _laserAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _laserAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
    _animController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _laserAnim,
      builder: (context, _) {
        return CustomPaint(
          size: Size.infinite,
          painter: _ViewfinderPainter(
            scanBoxSize: widget.scanBoxSize,
            laserProgress: _laserAnim.value,
          ),
        );
      },
    );
  }
}

class _ViewfinderPainter extends CustomPainter {
  final double scanBoxSize;
  final double laserProgress;

  _ViewfinderPainter({
    required this.scanBoxSize,
    required this.laserProgress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final boxRect = Rect.fromCenter(
      center: center,
      width: scanBoxSize,
      height: scanBoxSize,
    );

    // 1. Semi-transparent backdrop scrim around cut-out
    final backgroundPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final cutoutPath = Path()
      ..addRRect(RRect.fromRectAndRadius(boxRect, const Radius.circular(16)));
    final scrimPath = Path.combine(PathOperation.difference, backgroundPath, cutoutPath);

    final scrimPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.65)
      ..style = PaintingStyle.fill;
    canvas.drawPath(scrimPath, scrimPaint);

    // 2. Corner brackets (length: 24, stroke: 3.5)
    final cornerPaint = Paint()
      ..color = AppColors.accentTeal
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const cornerLength = 24.0;
    final r = boxRect;

    // Top-left
    canvas.drawLine(Offset(r.left, r.top + cornerLength), Offset(r.left, r.top), cornerPaint);
    canvas.drawLine(Offset(r.left, r.top), Offset(r.left + cornerLength, r.top), cornerPaint);

    // Top-right
    canvas.drawLine(Offset(r.right - cornerLength, r.top), Offset(r.right, r.top), cornerPaint);
    canvas.drawLine(Offset(r.right, r.top), Offset(r.right, r.top + cornerLength), cornerPaint);

    // Bottom-left
    canvas.drawLine(Offset(r.left, r.bottom - cornerLength), Offset(r.left, r.bottom), cornerPaint);
    canvas.drawLine(Offset(r.left, r.bottom), Offset(r.left + cornerLength, r.bottom), cornerPaint);

    // Bottom-right
    canvas.drawLine(Offset(r.right - cornerLength, r.bottom), Offset(r.right, r.bottom), cornerPaint);
    canvas.drawLine(Offset(r.right, r.bottom), Offset(r.right, r.bottom - cornerLength), cornerPaint);

    // 3. Sweeping Laser Beam Line with glow
    final laserY = r.top + (r.height * laserProgress);
    final laserPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          AppColors.accentTeal.withValues(alpha: 0.0),
          AppColors.accentTeal,
          AppColors.accentTeal,
          AppColors.accentTeal.withValues(alpha: 0.0),
        ],
        stops: const [0.0, 0.25, 0.75, 1.0],
      ).createShader(Rect.fromLTWH(r.left, laserY - 1, r.width, 2))
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(r.left + 8, laserY), Offset(r.right - 8, laserY), laserPaint);
  }

  @override
  bool shouldRepaint(covariant _ViewfinderPainter oldDelegate) {
    return oldDelegate.laserProgress != laserProgress ||
        oldDelegate.scanBoxSize != scanBoxSize;
  }
}
