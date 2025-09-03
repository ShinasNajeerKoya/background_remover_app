import 'dart:io';
import 'dart:ui';

import 'dart:typed_data';

import 'package:background_remover_app/config/themes/colors.dart';
import 'package:background_remover_app/config/themes/units.dart';
import 'package:background_remover_app/generated/app_icons.dart';
import 'package:background_remover_app/presentation/widgets/app_bottom_sheet/app_bottom_sheet.dart';
import 'package:background_remover_app/shared/helper_functions/custom_svg_icon.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:background_remover_app/presentation/feature/home/bloc/home_bloc.dart';
import 'package:background_remover_app/presentation/feature/home/bloc/home_state.dart';

import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../image_getter_files/bloc/image_getter_bloc.dart';
import '../utils/background_color_enum.dart';
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
  final imageBloc = GetIt.I<ImageBloc>();

  @override
  void initState() {
    super.initState();
    homeBloc.checkInitialPermission();
    imageBloc.fetchAutoUpload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,

          listener: (context, state) {
            // Show error
            if (state.error && state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red));
            }
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
                      ? NotchedImageContainer(imageFile: displayImage, homeBloc: homeBloc)
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

                  Spacer(),
                  Wrap(
                    spacing: 10,
                    children:
                        BackgroundColorOption.values.map((option) {
                          final color = option.color;
                          return GestureDetector(
                            onTap: () => homeBloc.changeBackgroundColor(option),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: color == Colors.transparent ? Colors.grey.shade300 : color,
                                border: Border.all(
                                  color: state.selectedBackgroundColor == option ? Colors.grey.shade900 : Colors.grey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:
                                  option == BackgroundColorOption.transparent
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
                          homeBloc.saveProcessedImageToGallery();
                        },
                      )
                      : StartEditingSwiperWidget(homeBloc: homeBloc),

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
                                // child: const CircularProgressIndicator.adaptive(
                                //   valueColor: AlwaysStoppedAnimation<Color>(
                                //     AppColors.kHomeBorderGoldColor,
                                //   ),
                                // ),
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

class CropperPage extends StatefulWidget {
  final File imageFile;

  const CropperPage({super.key, required this.imageFile});

  @override
  State<CropperPage> createState() => _CropperPageState();
}

class _CropperPageState extends State<CropperPage> {
  final _controller = CropController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            // Crop view
            Expanded(
              child: Crop(
                image: widget.imageFile.readAsBytesSync(),
                controller: _controller,
                aspectRatio: 1,
                withCircleUi: false,
                onCropped: (result) async {
                  switch (result) {
                    case CropSuccess(:final croppedImage):
                      final tempDir = await getTemporaryDirectory();
                      final file = File('${tempDir.path}/cropped_${DateTime.now().millisecondsSinceEpoch}.png');
                      await file.writeAsBytes(croppedImage);
                      Navigator.pop(context, file);

                    case CropFailure(:final cause):
                      debugPrint("Cropping failed: $cause");
                      Navigator.pop(context, null);
                  }
                },
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                  ElevatedButton(onPressed: () => _controller.crop(), child: const Text("Save")),
                ],
              ),
            ),
          ],
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
