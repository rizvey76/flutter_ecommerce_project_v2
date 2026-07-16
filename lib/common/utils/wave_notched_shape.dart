import 'package:flutter/material.dart';

class WaveNotchedShape extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    final notchRadius = guest != null ? guest.width / 2.0 : 0.0;
    const notchMargin = 6.0;

    Path path = Path();
    final double fabX = guest?.center.dx ?? host.center.dx;
    final double fabY = guest?.center.dy ?? 0;

    final double notchCenter = fabX;
    final double notchStart = notchCenter - notchRadius - notchMargin;
    final double notchEnd = notchCenter + notchRadius + notchMargin;

    // Start from bottom left
    path.moveTo(host.left, host.top);
    path.lineTo(notchStart, host.top);

    if (guest != null) {
      path.quadraticBezierTo(
        notchCenter,
        fabY - notchRadius - notchMargin, // dip height
        notchEnd,
        host.top,
      );
    }

    path.lineTo(host.right, host.top);
    path.lineTo(host.right, host.bottom);
    path.lineTo(host.left, host.bottom);
    path.close();
    return path;
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    final center = size.width / 2;
    final waveWidth = 60.0;
    final waveHeight = 20.0;

    path.lineTo(center - waveWidth, 0);
    path.quadraticBezierTo(
      center,
      -waveHeight,
      center + waveWidth,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
