import 'dart:io';

import 'package:background_remover_app/presentation/feature/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/units.dart';
import '../bloc/home_bloc.dart';
import '../utils/background_color_enum.dart';
import 'notched_border_painter.dart';
import 'notched_rounded_clipper.dart';

class NotchedImageContainer extends StatelessWidget {
  final File? imageFile;
  final HomeBloc homeBloc;

  const NotchedImageContainer({super.key, this.imageFile, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: horizontalPadding16,
      child: BlocSelector<HomeBloc, HomeState, bool>(
        bloc: homeBloc,

        selector: (state) => state.isRemovingBackground,

        builder: (context, backgroundRemovingState) {
          if (backgroundRemovingState) {
            // return Container(
            //   height: 55.h,
            //   width: 350.w,
            //   decoration: BoxDecoration(color: AppColors.kBlack, borderRadius: BorderRadius.circular(40.r)),
            //   alignment: Alignment.center,
            //   child: SizedBox(height: 55.h, width: 55.h, child: Lottie.asset('assets/lottie/loading_cat.json')),
            // );

            return CustomPaint(
              painter: NotchedBorderPainter(
                fillColor: Colors.black,
                borderColor: AppColors.kPrimaryGoldColor,
                strokeWidth: 1.5,
              ),
              child: SizedBox(
                height: 420.h,
                width: double.infinity,
                child: Lottie.asset('assets/lottie/loading_cat.json'),
              ),
            );
          }
          return Stack(
            children: [
              BlocSelector<HomeBloc, HomeState, BackgroundColorOption>(
                bloc: homeBloc,
                selector: (state) => state.selectedBackgroundColor,
                builder: (context, colorState) {
                  final imageBGColor = colorState.color;

                  return CustomPaint(
                    painter: NotchedBorderPainter(
                      fillColor: imageBGColor,
                      borderColor: AppColors.kPrimaryGoldColor,
                      strokeWidth: 1.5,
                    ),
                    child: SizedBox(height: 420.h, width: double.infinity),
                  );
                },
              ),
              if (imageFile != null)
                ClipPath(
                  clipper: NotchedRoundedClipper(),
                  child: Image.file(imageFile!, fit: BoxFit.cover, height: 420.h, width: double.infinity),
                ),
            ],
          );
        },
      ),
    );
  }
}
