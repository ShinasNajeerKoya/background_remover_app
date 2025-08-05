// ignore: dangling_library_doc_comments
/// this file is for units (padding, borderRadius, etc) in reference with the screen util package for dynamic units

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Units {
  Units._();

  static const double _kPaddingUnit = 4.0;
  static const double kXSPadding = _kPaddingUnit;
  static const double kSPadding = 2 * _kPaddingUnit;
  static const double kMPadding = 3 * _kPaddingUnit;
  static const double kStandardPadding = 4 * _kPaddingUnit;
  static const double kLPadding = 5 * _kPaddingUnit;
  static const double kXLPadding = 6 * _kPaddingUnit;
  static const double kXXLPadding = 7 * _kPaddingUnit;
  static const double kXXXLPadding = 8 * _kPaddingUnit;

  static const double kCardBorderRadius = 5;
  static const double kCardElevation = 4;
  static const double kCardCircularBorderRadius = 4;
  static const double kMCardCircularBorderRadius = 2 * kCardBorderRadius;

  static const double kButtonBorderRadius = 8;
  static const double kButtonElevation = 4;
  static const double kTextBoxHeight = 36;
  static const double kButtonHeight = 44;
  static const double kIconHeight = 22;
  static const double kExpandedHeight = 190;
  static const double kMinExpandedHeight = 100;
  static const double kVeryMinExpandedHeight = 80;
  static const double kContentOffSet = 50;
  static const double kAppBarHeight = 64;
}

const emptyWidget = SizedBox();
const emptyWidgetWide = SizedBox(width: double.infinity);
const emptyWidgetDimension = SizedBox(width: kMinInteractiveDimension);

final horizontalMargin2 = SizedBox(width: 2.w);
final horizontalMargin4 = SizedBox(width: 4.w);
final horizontalMargin5 = SizedBox(width: 5.w);
final horizontalMargin6 = SizedBox(width: 6.w);
final horizontalMargin8 = SizedBox(width: 8.w);
final horizontalMargin12 = SizedBox(width: 12.w);
final horizontalMargin16 = SizedBox(width: 16.w);
final horizontalMargin20 = SizedBox(width: 20.w);
final horizontalMargin24 = SizedBox(width: 24.w);
final horizontalMargin28 = SizedBox(width: 28.w);
final horizontalMargin32 = SizedBox(width: 32.w);
final horizontalMargin36 = SizedBox(width: 36.w);
final horizontalMargin40 = SizedBox(width: 40.w);

final verticalMargin2 = SizedBox(height: 2.h);
final verticalMargin4 = SizedBox(height: 4.h);
final verticalMargin5 = SizedBox(height: 5.h);
final verticalMargin6 = SizedBox(height: 6.h);
final verticalMargin8 = SizedBox(height: 8.h);
final verticalMargin12 = SizedBox(height: 12.h);
final verticalMargin16 = SizedBox(height: 16.h);
final verticalMargin20 = SizedBox(height: 20.h);
final verticalMargin24 = SizedBox(height: 24.h);
final verticalMargin28 = SizedBox(height: 28.h);
final verticalMargin32 = SizedBox(height: 32.h);
final verticalMargin36 = SizedBox(height: 36.h);
final verticalMargin40 = SizedBox(height: 40.h);
final verticalMargin48 = SizedBox(height: 48.h);
final verticalMargin60 = SizedBox(height: 60.h);
final verticalMargin80 = SizedBox(height: 80.h);
final verticalMargin100 = SizedBox(height: 100.h);
final verticalMargin110 = SizedBox(height: 110.h);
final verticalMargin120 = SizedBox(height: 120.h);

const zeroPadding = EdgeInsets.zero;

final horizontalPadding4 = EdgeInsets.symmetric(horizontal: 4.w);
final horizontalPadding5 = EdgeInsets.symmetric(horizontal: 5.w);
final horizontalPadding6 = EdgeInsets.symmetric(horizontal: 6.w);
final horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8.w);
final horizontalPadding10 = EdgeInsets.symmetric(horizontal: 10.w);
final horizontalPadding12 = EdgeInsets.symmetric(horizontal: 12.w);
final horizontalPadding14 = EdgeInsets.symmetric(horizontal: 14.w);
final horizontalPadding16 = EdgeInsets.symmetric(horizontal: 16.w);
final horizontalPadding20 = EdgeInsets.symmetric(horizontal: 20.w);
final horizontalPadding24 = EdgeInsets.symmetric(horizontal: 24.w);
final horizontalPadding28 = EdgeInsets.symmetric(horizontal: 28.w);
final horizontalPadding32 = EdgeInsets.symmetric(horizontal: 32.w);
final horizontalPadding36 = EdgeInsets.symmetric(horizontal: 36.w);
final horizontalPadding40 = EdgeInsets.symmetric(horizontal: 40.w);

final verticalPadding2 = EdgeInsets.symmetric(vertical: 2.h);
final verticalPadding4 = EdgeInsets.symmetric(vertical: 4.h);
final verticalPadding5 = EdgeInsets.symmetric(vertical: 5.h);
final verticalPadding6 = EdgeInsets.symmetric(vertical: 6.h);
final verticalPadding8 = EdgeInsets.symmetric(vertical: 8.h);
final verticalPadding10 = EdgeInsets.symmetric(vertical: 10.h);
final verticalPadding12 = EdgeInsets.symmetric(vertical: 12.h);
final verticalPadding16 = EdgeInsets.symmetric(vertical: 16.h);
final verticalPadding20 = EdgeInsets.symmetric(vertical: 20.h);
final verticalPadding24 = EdgeInsets.symmetric(vertical: 24.h);
final verticalPadding28 = EdgeInsets.symmetric(vertical: 28.h);
final verticalPadding32 = EdgeInsets.symmetric(vertical: 32.h);
final verticalPadding36 = EdgeInsets.symmetric(vertical: 36.h);
final verticalPadding40 = EdgeInsets.symmetric(vertical: 40.h);
final verticalPadding64 = EdgeInsets.symmetric(vertical: 64.h);

final allPadding4 = EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w);
final allPadding5 = EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w);
final allPadding6 = EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w);
final allPadding8 = EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w);
final allPadding10 = EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w);
final allPadding12 = EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w);
final allPadding14 = EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w);
final allPadding16 = EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w);
final allPadding18 = EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w);
final allPadding20 = EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w);
final allPadding24 = EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w);
final allPadding28 = EdgeInsets.symmetric(vertical: 28.h, horizontal: 28.w);
final allPadding32 = EdgeInsets.symmetric(vertical: 32.h, horizontal: 32.w);
final allPadding36 = EdgeInsets.symmetric(vertical: 36.h, horizontal: 36.w);
final allPadding40 = EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w);

final rightTopPadding4 = EdgeInsets.only(right: 4.w, top: 4.h);

final rightPadding4 = EdgeInsets.only(right: 4.w);
final rightPadding6 = EdgeInsets.only(right: 6.w);
final rightPadding8 = EdgeInsets.only(right: 8.w);
final rightPadding12 = EdgeInsets.only(right: 12.w);
final rightPadding16 = EdgeInsets.only(right: 16.w);
final rightPadding60 = EdgeInsets.only(right: 60.w);
final rightPadding20 = EdgeInsets.only(right: 20.w);
final rightPadding26 = EdgeInsets.only(right: 26.w);

final leftPadding4 = EdgeInsets.only(left: 4.w);
final leftPadding8 = EdgeInsets.only(left: 8.w);
final leftPadding12 = EdgeInsets.only(left: 12.w);
final leftPadding16 = EdgeInsets.only(left: 16.w);
final leftPadding20 = EdgeInsets.only(left: 20.w);
final leftPadding40 = EdgeInsets.only(left: 40.w);
final leftPadding60 = EdgeInsets.only(left: 60.w);

final bottomPadding4 = EdgeInsets.only(bottom: 4.h);
final bottomPadding6 = EdgeInsets.only(bottom: 6.h);
final bottomPadding8 = EdgeInsets.only(bottom: 8.h);
final bottomPadding12 = EdgeInsets.only(bottom: 12.h);
final bottomPadding16 = EdgeInsets.only(bottom: 16.h);
final bottomPadding20 = EdgeInsets.only(bottom: 20.h);
final bottomPadding24 = EdgeInsets.only(bottom: 24.h);
final bottomPadding28 = EdgeInsets.only(bottom: 28.h);
final bottomPadding32 = EdgeInsets.only(bottom: 32.h);
final bottomPadding64 = EdgeInsets.only(bottom: 64.h);
final bottomPadding75 = EdgeInsets.only(bottom: 75.h);

final topPadding2 = EdgeInsets.only(top: 2.h);
final topPadding4 = EdgeInsets.only(top: 4.h);
final topPadding6 = EdgeInsets.only(top: 6.h);
final topPadding8 = EdgeInsets.only(top: 8.h);
final topPadding10 = EdgeInsets.only(top: 10.h);
final topPadding12 = EdgeInsets.only(top: 12.h);
final topPadding16 = EdgeInsets.only(top: 16.h);
final topPadding20 = EdgeInsets.only(top: 20.h);
final topPadding24 = EdgeInsets.only(top: 24.h);
final topPadding32 = EdgeInsets.only(top: 32.h);
final topPadding40 = EdgeInsets.only(top: 40.h);
final topPadding52 = EdgeInsets.only(top: 52.h);
final topPadding60 = EdgeInsets.only(top: 60.h);
