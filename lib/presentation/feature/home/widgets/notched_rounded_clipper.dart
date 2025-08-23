import 'package:flutter/material.dart';

class NotchedRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    const double cornerRadius = 24;
    const double notchHeight = 12;
    const double notchWidth = 40;
    const double notchRadius = 30;

    final double leftStart = size.width * 0.38;
    final double rightEnd = size.width * 0.62;

    // Start with top-left rounded corner
    path.moveTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    // Left straight line
    path.lineTo(leftStart - notchRadius, 0);

    // Left curve into notch (cubic for smooth S-curve)
    path.cubicTo(
      leftStart - notchRadius / 2,
      0, // control point 1
      leftStart - notchRadius / 2,
      notchHeight, // control point 2
      leftStart,
      notchHeight, // end point
    );

    // Horizontal middle of notch
    path.lineTo(rightEnd, notchHeight);

    // Right curve out of notch (mirror of left)
    path.cubicTo(rightEnd + notchRadius / 2, notchHeight, rightEnd + notchRadius / 2, 0, rightEnd + notchRadius, 0);

    // Right straight to top-right corner
    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);

    // Continue the rounded rectangle
    path.lineTo(size.width, size.height - cornerRadius);
    path.quadraticBezierTo(size.width, size.height, size.width - cornerRadius, size.height);
    path.lineTo(cornerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
