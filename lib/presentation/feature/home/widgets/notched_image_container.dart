import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/units.dart';
import '../pages/home_page.dart';
import 'notched_border_painter.dart';
import 'notched_rounded_clipper.dart';

class NotchedImageContainer extends StatelessWidget {
  final File? imageFile;

  const NotchedImageContainer({super.key, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: horizontalPadding16,
      child: Stack(
        children: [
          CustomPaint(
            painter: NotchedBorderPainter(
              fillColor: Colors.black,
              borderColor: AppColors.kPrimaryGoldColor,
              strokeWidth: 1.5,
            ),
            child: SizedBox(height: 420.h, width: double.infinity),
          ),
          if (imageFile != null)
            ClipPath(
              clipper: NotchedRoundedClipper(),
              child: Image.file(imageFile!, fit: BoxFit.cover, height: 420.h, width: double.infinity),
            ),
        ],
      ),
    );
  }
}
