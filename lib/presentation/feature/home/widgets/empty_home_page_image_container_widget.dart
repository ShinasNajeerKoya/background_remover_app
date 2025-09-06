import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/units.dart';
import '../../../../generated/app_icons.dart';
import '../../../../shared/helper_functions/custom_svg_icon.dart';
import 'notched_rounded_clipper.dart';

class EmptyHomePageImageContainerWidget extends StatelessWidget {
  const EmptyHomePageImageContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: horizontalPadding16,
      child: ClipPath(
        clipper: NotchedRoundedClipper(),
        child: Container(
          height: 420.h,
          padding: EdgeInsets.only(left: 10.w, right: 25.w, top: 60.h, bottom: 35.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: homeGoldenGradient,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSvgIcon(AppIcons.kHomeScreenWelcomeText),
              Row(children: [Spacer(), CustomSvgIcon(AppIcons.kLogoBlack, height: 40.h), horizontalMargin12]),
            ],
          ),
        ),
      ),
    );
  }
}
