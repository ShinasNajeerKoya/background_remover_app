import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import 'notched_rounded_clipper.dart';

class NotchedBorderPainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;
  final double strokeWidth;

  NotchedBorderPainter({required this.fillColor, required this.borderColor, this.strokeWidth = 1});

  @override
  void paint(Canvas canvas, Size size) {
    final path = NotchedRoundedClipper().getClip(size);

    // Fill
    final fillPaint =
    Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    // Border
    final borderPaint =
    Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
