import 'package:flutter/material.dart';
import 'package:qr/qr.dart';
import '../theme/app_colors.dart';
import '../theme/app_radii.dart';

/// Clean, high-performance QR code renderer using [CustomPainter] and package:qr
class QrCodeWidget extends StatelessWidget {
  final String data;
  final double size;
  final Color color;
  final Color backgroundColor;
  final double padding;

  const QrCodeWidget({
    super.key,
    required this.data,
    this.size = 200.0,
    this.color = AppColors.primaryNavy,
    this.backgroundColor = Colors.white,
    this.padding = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    QrCode qrCode;
    try {
      qrCode = QrCode.fromData(
        data: data,
        errorCorrectLevel: QrErrorCorrectLevel.M,
      );
    } catch (_) {
      qrCode = QrCode(4, QrErrorCorrectLevel.L);
      qrCode.addData(data);
    }

    final qrImage = QrImage(qrCode);

    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppRadii.borderLg,
      ),
      child: CustomPaint(
        painter: _QrPainter(
          qrImage: qrImage,
          color: color,
        ),
      ),
    );
  }
}

class _QrPainter extends CustomPainter {
  final QrImage qrImage;
  final Color color;

  _QrPainter({required this.qrImage, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final moduleCount = qrImage.moduleCount;
    if (moduleCount == 0) return;

    final moduleWidth = size.width / moduleCount;
    final moduleHeight = size.height / moduleCount;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (int r = 0; r < moduleCount; r++) {
      for (int c = 0; c < moduleCount; c++) {
        if (qrImage.isDark(r, c)) {
          final rect = Rect.fromLTWH(
            c * moduleWidth,
            r * moduleHeight,
            moduleWidth + 0.3, // Slight overlap to prevent anti-aliasing gaps
            moduleHeight + 0.3,
          );
          canvas.drawRect(rect, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _QrPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.qrImage != qrImage;
  }
}
