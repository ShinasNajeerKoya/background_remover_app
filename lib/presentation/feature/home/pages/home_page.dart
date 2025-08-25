import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:background_remover_app/config/themes/colors.dart';
import 'package:background_remover_app/config/themes/units.dart';
import 'package:background_remover_app/generated/app_icons.dart';
import 'package:background_remover_app/presentation/widgets/app_bottom_sheet/app_bottom_sheet.dart';
import 'package:background_remover_app/shared/helper_functions/custom_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:background_remover_app/presentation/feature/home/bloc/home_bloc.dart';
import 'package:background_remover_app/presentation/feature/home/bloc/home_state.dart';

import 'package:get_it/get_it.dart';

import '../../onboarding/widgets/swipe_to_get_started_widget.dart';
import '../widgets/notched_image_container.dart';
import '../widgets/notched_rounded_clipper.dart';
import '../widgets/swipe_to_get_started_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const id = '/homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeBloc = GetIt.I<HomeBloc>();

  @override
  void initState() {
    super.initState();
    homeBloc.checkInitialPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          // listener: (context, state) {
          //   if (state.error && state.errorMessage.isNotEmpty) {
          //     ScaffoldMessenger.of(
          //       context,
          //     ).showSnackBar(SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red));
          //   }
          // },
          listener: (context, state) {
            // Show error
            if (state.error && state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red));
            }
            // Reset slider automatically when needed
            // if ((state.sliderStage == SliderStage.pickImage && state.selectedImage == null) ||
            //     (state.sliderStage == SliderStage.removeBackground && state.processedImage == null) ||
            //     (state.sliderStage == SliderStage.saveImage && state.processedImage == null)) {
            //   homeBloc.updateDragX(0.0);
            // }
          },

          builder: (context, state) {
            final displayImage =
                state.processedImage != null ? File(state.processedImage!.processedImagePath) : state.homeSelectedImage;

            return SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalMargin36,
                  CustomSvgIcon(AppIcons.kSplashGoldLogo, color: AppColors.kHomeLogoGoldColor, height: 50.h),
                  verticalMargin36,

                  displayImage != null
                      ? NotchedImageContainer(imageFile: displayImage)
                      : Container(
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
                                Row(
                                  children: [
                                    Spacer(),
                                    CustomSvgIcon(AppIcons.kLogoBlack, height: 40.h),
                                    horizontalMargin12,
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                  // SwipeToGetStartedWidget(homeBloc: homeBloc),
                  Spacer(),
                  Wrap(
                    spacing: 10,
                    children:
                        [
                          Colors.white,
                          Colors.red,
                          Colors.green,
                          Colors.blue,
                          Colors.yellow,
                          Colors.purple,
                          Colors.transparent,
                        ].map((color) {
                          return GestureDetector(
                            onTap: () => homeBloc.changeBackgroundColor(color),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: color == Colors.transparent ? Colors.grey.shade300 : color,
                                border: Border.all(
                                  color: state.selectedBackgroundColor == color ? Colors.black : Colors.grey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:
                                  color == Colors.transparent
                                      ? const Icon(Icons.not_interested, color: Colors.red)
                                      : null,
                            ),
                          );
                        }).toList(),
                  ),
                  Spacer(),

                  // bottom sheet
                  displayImage != null
                      ? SwipeToGetStartedWidget(
                        homeBloc: homeBloc,
                        title: "Own This Moment",
                        onSlideComplete: () {
                          // AppBottomSheet.showDraggable(
                          //   context: context,
                          //   initialSize: 0.87,
                          //   builder: (context, scrollController, draggableScrollController) {
                          //     return SingleChildScrollView(
                          //       child: SizedBox(
                          //         width: double.maxFinite,
                          //         child: Column(
                          //           children: [
                          //             InkWell(
                          //               onTap: () => homeBloc.pickImageFromGallery(),
                          //               child: BlocBuilder<HomeBloc, HomeState>(
                          //                 bloc: homeBloc,
                          //                 builder: (context, state) {
                          //                   return DashedBorderContainer(
                          //                     height: 423.h,
                          //                     width: 350.w,
                          //                     margin: EdgeInsets.symmetric(horizontal: 20.w),
                          //                     padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                          //                     child:
                          //                         state.selectedImage != null
                          //                             ? ClipRRect(
                          //                               borderRadius: BorderRadius.circular(8.r),
                          //                               child: Image.file(state.selectedImage!, fit: BoxFit.cover),
                          //                             )
                          //                             : Column(
                          //                               mainAxisSize: MainAxisSize.min,
                          //                               spacing: 8.h,
                          //                               children: [
                          //                                 Expanded(
                          //                                   child: Center(
                          //                                     child: Column(
                          //                                       mainAxisSize: MainAxisSize.min,
                          //                                       spacing: 8.h,
                          //                                       children: [
                          //                                         CustomSvgIcon(AppIcons.kGallery),
                          //                                         Text(
                          //                                           'Select image',
                          //                                           style: TextStyle(fontWeight: FontWeight.w600),
                          //                                         ),
                          //                                       ],
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //
                          //                                 // Bottom-right logo
                          //                                 Align(
                          //                                   alignment: Alignment.bottomRight,
                          //                                   child: Padding(
                          //                                     padding: EdgeInsets.only(right: 12.w, bottom: 8.h),
                          //                                     child: CustomSvgIcon(AppIcons.kLogoBlack, height: 40.h),
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                   );
                          //                 },
                          //               ),
                          //             ),
                          //             verticalMargin36,
                          //
                          //             InkWell(
                          //               onTap: () => homeBloc.cropSelectedImage(),
                          //               child: Container(
                          //                 height: 55.h,
                          //                 width: 150.w,
                          //                 decoration: BoxDecoration(
                          //                   color: AppColors.kBlack,
                          //                   borderRadius: BorderRadius.circular(14.r),
                          //                 ),
                          //                 child: Row(
                          //                   mainAxisAlignment: MainAxisAlignment.center,
                          //                   spacing: 12.w,
                          //                   children: [
                          //                     CustomSvgIcon(AppIcons.kCrop),
                          //                     Text(
                          //                       'Crop',
                          //                       style: TextStyle(
                          //                         fontSize: 18.sp,
                          //                         fontWeight: FontWeight.bold,
                          //                         color: AppColors.kHomeBorderGoldColor,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //             verticalMargin24,
                          //
                          //             InkWell(
                          //               onTap: () {
                          //                 homeBloc.saveSelectedImage();
                          //                 Navigator.pop(context); // Close bottom sheet
                          //               },
                          //               child: Container(
                          //                 height: 55.h,
                          //                 width: 350.w,
                          //                 decoration: BoxDecoration(
                          //                   color: AppColors.kBlack,
                          //                   borderRadius: BorderRadius.circular(40.r),
                          //                 ),
                          //                 alignment: Alignment.center,
                          //                 child: Text(
                          //                   'Save',
                          //                   style: TextStyle(
                          //                     fontSize: 20.sp,
                          //                     fontWeight: FontWeight.bold,
                          //                     color: AppColors.kHomeBorderGoldColor,
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // );
                        },
                      )
                      : SwipeToGetStartedWidget(
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
                                                                  Text(
                                                                    'Select image',
                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                  ),
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

                                      // crop button
                                      InkWell(
                                        onTap: () => homeBloc.cropSelectedImage(),
                                        child: Container(
                                          height: 55.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                            color: AppColors.kBlack,
                                            borderRadius: BorderRadius.circular(14.r),
                                          ),
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

                                      // save button
                                      InkWell(
                                        onTap: () {
                                          homeBloc.saveSelectedImage();
                                          Navigator.pop(context); // Close bottom sheet
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
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),

                  /*
                  if (state.isLoading) const CircularProgressIndicator(),
                  if (state.isProcessing) ...[
                    const CircularProgressIndicator(),
                    const SizedBox(height: 10),
                    Text('Processing: ${state.processingProgress}%'),
                  ],
                  if (state.isSaving) ...[
                    const CircularProgressIndicator(),
                    const SizedBox(height: 10),
                    const Text('Saving image...'),
                  ],
            */
                  // const SizedBox(height: 20),

                  // Pick Image Buttons
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

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
          padding: padding, // inner spacing
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

/*
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state) {
          if (state.error && state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            // <- ADD THIS to avoid overflow
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Selected Image
                    if (state.selectedImage != null) ...[
                      Text("Selected Image"),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.file(state.selectedImage!, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // Processed Image
                    if (state.processedImage != null) ...[
                      const Text("Processed Image"),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.file(File(state.processedImage!.processedImagePath), fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // State indicators
                    if (state.isLoading) const CircularProgressIndicator(),
                    if (state.isProcessing) ...[
                      const CircularProgressIndicator(),
                      const SizedBox(height: 10),
                      Text('Processing: ${state.processingProgress}%'),
                    ],
                    if (state.isSaving) ...[
                      const CircularProgressIndicator(),
                      const SizedBox(height: 10),
                      const Text('Saving image...'),
                    ],

                    const SizedBox(height: 20),

                    // Pick Image Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed:
                              (state.isLoading || state.isProcessing || state.isSaving)
                                  ? null
                                  : () => homeBloc.pickImageFromGallery(),
                          icon: const Icon(Icons.photo_library),
                          label: const Text('Gallery'),
                        ),
                        ElevatedButton.icon(
                          onPressed:
                              (state.isLoading || state.isProcessing || state.isSaving)
                                  ? null
                                  : () => homeBloc.pickImageFromCamera(),
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Camera'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Remove BG / Save
                    if (state.selectedImage != null)
                      ElevatedButton.icon(
                        onPressed: state.isProcessing || state.isSaving ? null : () => homeBloc.removeBackground(),
                        icon: const Icon(Icons.auto_fix_high),
                        label: const Text('Remove Background'),
                      ),

                    if (state.processedImage != null) ...[
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: state.isSaving ? null : () => homeBloc.saveProcessedImage(),
                        icon: const Icon(Icons.save),
                        label: const Text('Save to Gallery'),
                      ),
                    ],

                    const SizedBox(height: 20),

                    // Background color picker
                    if (state.selectedImage != null)
                      ElevatedButton.icon(
                        onPressed: () => homeBloc.toggleBackgroundColorPicker(),
                        icon: const Icon(Icons.color_lens),
                        label: const Text('Change Background Color'),
                      ),

                    if (state.showBackgroundColorPicker) ...[
                      const SizedBox(height: 20),
                      const Text('Select Background Color:'),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children:
                            [
                              Colors.white,
                              Colors.red,
                              Colors.green,
                              Colors.blue,
                              Colors.yellow,
                              Colors.purple,
                              Colors.transparent,
                            ].map((color) {
                              return GestureDetector(
                                onTap: () => homeBloc.changeBackgroundColor(color),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: color == Colors.transparent ? Colors.grey.shade300 : color,
                                    border: Border.all(
                                      color: state.selectedBackgroundColor == color ? Colors.black : Colors.grey,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child:
                                      color == Colors.transparent
                                          ? const Icon(Icons.not_interested, color: Colors.red)
                                          : null,
                                ),
                              );
                            }).toList(),
                      ),
                    ],

                    const SizedBox(height: 20),

                    // Reset button
                    ElevatedButton.icon(
                      onPressed:
                          state.isLoading || state.isProcessing || state.isSaving ? null : () => homeBloc.reset(),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reset'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    ),

                    if (!state.hasPermission) ...[
                      const SizedBox(height: 20),
                      Card(
                        color: Colors.orange.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              const Text(
                                'Storage permission is required to pick and save images',
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => homeBloc.requestPermission(),
                                child: const Text('Grant Permission'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
      */
