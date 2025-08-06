import 'dart:io';

import 'package:background_remover_app/config/themes/colors.dart';
import 'package:background_remover_app/config/themes/units.dart';
import 'package:background_remover_app/generated/app_icons.dart';
import 'package:background_remover_app/shared/helper_functions/custom_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:background_remover_app/presentation/feature/home/bloc/home_bloc.dart';
import 'package:background_remover_app/presentation/feature/home/bloc/home_state.dart';

import 'package:get_it/get_it.dart';

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
      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listener: (context, state) {
            if (state.error && state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red));
            }
          },
          builder: (context, state) {
            final isDataEmpty = state.selectedImage == null;

            return SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalMargin36,
                  CustomSvgIcon(AppIcons.kSplashGoldLogo, color: AppColors.kHomeLogoGoldColor, height: 50.h),
                  verticalMargin36,

                  isDataEmpty
                      ? Container(
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
                            width: double.infinity,
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
                      )
                      : Container(
                        margin: horizontalPadding16,
                        child: CustomPaint(
                          painter: NotchedBorderPainter(
                            fillColor: Colors.black,
                            borderColor: AppColors.kPrimaryGoldColor,
                            strokeWidth: 1.5,
                          ),
                          child: SizedBox(
                            height: 420.h,
                            width: double.infinity,
                            child: Column(
                              children: [
                                // Your content inside the container
                              ],
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


class NotchedBorderPainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;
  final double strokeWidth;

  NotchedBorderPainter({required this.fillColor, required this.borderColor, this.strokeWidth = 1});

  @override
  void paint(Canvas canvas, Size size) {
    final path = NotchedRoundedClipper().getClip(size);

    // Fill
    final fillPaint =
        Paint()
          ..color = fillColor
          ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    // Border
    final borderPaint =
        Paint()
          ..color = borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// class NotchedRoundedClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//
//     // Example shape: rounded rectangle with a notch at the top center
//     double notchWidth = 40;
//     double notchHeight = 20;
//     double radius = 16;
//
//     double primaryWidth = size.width / 3;
//     double secondaryWidth = primaryWidth * 2;
//
//     path.moveTo(0, radius);
//     path.quadraticBezierTo(0, 0, radius, 0);
//
//     // left slope
//     path.lineTo(primaryWidth - notchWidth, 0);
//     path.quadraticBezierTo(primaryWidth, 0, primaryWidth, 10);
//
//     path.lineTo(primaryWidth, 10);
//     path.quadraticBezierTo(primaryWidth, 20, primaryWidth + notchWidth, 20);
//
//     // right slope
//     path.lineTo(secondaryWidth - notchWidth, 20);
//     path.quadraticBezierTo(secondaryWidth, 20, secondaryWidth, 10);
//
//     path.lineTo(secondaryWidth, 10);
//     path.quadraticBezierTo(secondaryWidth, 0, secondaryWidth + notchWidth, 0);
//
//     path.lineTo(size.width - radius, 0);
//     path.quadraticBezierTo(size.width, 0, size.width, radius);
//     path.lineTo(size.width, size.height - radius);
//     path.quadraticBezierTo(size.width, size.height, size.width - radius, size.height);
//     path.lineTo(radius, size.height);
//     path.quadraticBezierTo(0, size.height, 0, size.height - radius);
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
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
