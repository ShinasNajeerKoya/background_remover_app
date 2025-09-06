import 'dart:io';

import 'package:background_remover_app/presentation/feature/home/widgets/swipe_to_get_started_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/units.dart';
import '../../../../generated/app_icons.dart';
import '../../../../shared/helper_functions/custom_svg_icon.dart';
import '../../../widgets/app_bottom_sheet/app_bottom_sheet.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../pages/home_page.dart';
import 'cropper_page.dart';
import 'dashed_border_container.dart';

class StartEditingSwiperWidget extends StatelessWidget {
  const StartEditingSwiperWidget({super.key, required this.homeBloc});

  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return SwipeToGetStartedWidget(
      homeBloc: homeBloc,
      title: "Start Editing",
      onSlideComplete: () {
        AppBottomSheet.showDraggable(
          context: context,
          initialSize: 0.87,
          builder: (context, scrollController, draggableScrollController) {
            return SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => homeBloc.pickImageFromGallery(),
                      child: BlocBuilder<HomeBloc, HomeState>(
                        bloc: homeBloc,
                        builder: (context, state) {
                          return DashedBorderContainer(
                            height: 423.h,
                            width: 350.w,
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                            child:
                                state.selectedImage != null
                                    ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: Image.file(state.selectedImage!, fit: BoxFit.cover),
                                    )
                                    : Column(
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 8.h,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              spacing: 8.h,
                                              children: [
                                                CustomSvgIcon(AppIcons.kGallery),
                                                Text('Select image', style: TextStyle(fontWeight: FontWeight.w600)),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // Bottom-right logo
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                            padding: EdgeInsets.only(right: 12.w, bottom: 8.h),
                                            child: CustomSvgIcon(AppIcons.kLogoBlack, height: 40.h),
                                          ),
                                        ),
                                      ],
                                    ),
                          );
                        },
                      ),
                    ),
                    verticalMargin36,

                    InkWell(
                      onTap: () async {
                        if (homeBloc.state.selectedImage == null) return;

                        final croppedFile = await Navigator.push<File?>(
                          context,
                          MaterialPageRoute(builder: (_) => CropperPage(imageFile: homeBloc.state.selectedImage!)),
                        );

                        if (croppedFile != null) {
                          homeBloc.updateCroppedImage(croppedFile);
                        }
                      },
                      child: Container(
                        height: 55.h,
                        width: 150.w,
                        decoration: BoxDecoration(color: AppColors.kBlack, borderRadius: BorderRadius.circular(14.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 12.w,
                          children: [
                            CustomSvgIcon(AppIcons.kCrop),
                            Text(
                              'Crop',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kHomeBorderGoldColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    verticalMargin24,

                    BlocListener<HomeBloc, HomeState>(
                      bloc: homeBloc,
                      listenWhen:
                          (previous, current) =>
                              previous.isSaving != current.isSaving ||
                              previous.processedImage != current.processedImage,
                      listener: (context, state) {
                        // When saving finishes and processedImage is set
                        if (!state.isSaving && state.processedImage != null) {
                          Navigator.pop(context);
                        }
                      },
                      child: BlocSelector<HomeBloc, HomeState, bool>(
                        bloc: homeBloc,
                        selector: (state) => state.isRemovingBackground,
                        builder: (context, isLoading) {
                          if (isLoading) {
                            return Container(
                              height: 55.h,
                              width: 350.w,
                              decoration: BoxDecoration(
                                color: AppColors.kBlack,
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 55.h,
                                width: 55.h,
                                child: Lottie.asset('assets/lottie/loading_cat.json'),
                              ),
                            );
                          }

                          return InkWell(
                            onTap: () {
                              homeBloc.saveSelectedImage(backgroundColor: Colors.transparent);
                            },
                            child: Container(
                              height: 55.h,
                              width: 350.w,
                              decoration: BoxDecoration(
                                color: AppColors.kBlack,
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kHomeBorderGoldColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
