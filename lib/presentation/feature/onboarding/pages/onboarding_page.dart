import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/units.dart';
import '../../../../core/routes/route_config.gr.dart';
import '../../../../generated/app_icons.dart';
import '../../../../shared/helper_functions/custom_svg_icon.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_state.dart';
import '../widgets/swipe_to_get_started_widget.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  static const id = '/onboardingPage';

  OnboardingPage({super.key});

  final onboardingBloc = GetIt.I<OnboardingBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingState>(
      bloc: onboardingBloc,
      listener: (context, state) {
        if (state.isCompleted) {
          context.router.replaceAll([HomeRoute()]);
        }
      },
      child: Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onboardingBloc.completeOnboardingFlow();
          });
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.kSplashBlackBgLeftColor, AppColors.kSplashBlackBgRightColor],
                ),
              ),
              child: Column(
                children: [
                  verticalMargin120,

                  // 🔴 Top container for SVG
                  SizedBox(height: 80.h, width: double.infinity, child: CustomSvgIcon(AppIcons.kSplashGoldLogo)),

                  verticalMargin20,
                  SizedBox(
                    width: 100,
                    child: Divider(
                      color: AppColors.kPrimaryGoldColor.withOpacity(0.5),
                      thickness: 1, // Optional: set thickness
                    ),
                  ),
                  verticalMargin8,
                  SizedBox(height: 66.h, width: double.infinity, child: CustomSvgIcon(AppIcons.kPrestigePixels)),

                  Spacer(),
                  Align(alignment: Alignment.bottomLeft, child: CustomSvgIcon(AppIcons.kSplashLogoGrey)),
                  // SwipeToGetStartedWidget(onboardingBloc: onboardingBloc),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
