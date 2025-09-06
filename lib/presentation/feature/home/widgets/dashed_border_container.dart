import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  const DashedBorderContainer({
    super.key,
    required this.height,
    required this.width,
    this.child,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin, // outside spacing
      child: CustomPaint(
        painter: _DashedBorderPainter(),
        child: Container(
          height: height,
          width: width,
          color: Colors.transparent,
          padding: padding,
          // inner spacing
          child: child,
        ),
      ),
    );
  }
}


class _DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
    Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;

    const double dashWidth = 6;
    const double dashSpace = 3;

    final RRect rRect = RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(5));

    Path path = Path()..addRRect(rRect);
    PathMetrics pathMetrics = path.computeMetrics();

    for (PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final double nextDistance = distance + dashWidth;
        canvas.drawPath(pathMetric.extractPath(distance, nextDistance), paint);
        distance = nextDistance + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

