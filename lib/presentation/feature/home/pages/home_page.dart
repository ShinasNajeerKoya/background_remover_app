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

import '../../../../image_getter_files/bloc/image_getter_bloc.dart';
import '../widgets/background_color_selection_widget.dart';
import '../widgets/empty_home_page_image_container_widget.dart';
import '../widgets/image_saved_info_widget.dart';
import '../widgets/notched_image_container.dart';
import '../widgets/start_editing_swiper_widget.dart';
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
                      : EmptyHomePageImageContainerWidget(),

                  Spacer(),
                  BackgroundColorSelectionWidget(homeBloc: homeBloc, state: state),
                  Spacer(),
                  ImageSavedInfoWidget(homeBloc: homeBloc),
                  SizedBox(height: 12.h),

                  displayImage != null
                      ? SwipeToGetStartedWidget(
                        homeBloc: homeBloc,
                        title: "Own This Moment",
                        onSlideComplete: () {
                          homeBloc.saveProcessedImageToGallery();
                        },
                      )
                      : StartEditingSwiperWidget(homeBloc: homeBloc),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
