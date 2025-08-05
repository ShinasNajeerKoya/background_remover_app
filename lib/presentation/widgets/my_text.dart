import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? fontColor;
  final double? letterSpacing;
  final double? lineHeight;
  final int? maxLines;

  const MyText(
    this.title, {
    super.key,
    this.fontWeight,
    this.fontSize,
    this.fontColor,
    this.maxLines,
    this.letterSpacing,
    this.lineHeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 1,
      textAlign: textAlign,
      style: TextStyle(
        letterSpacing: letterSpacing,
        height: lineHeight,
        color: fontColor ?? Color(0xff573e21),
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
      ),
      // style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
