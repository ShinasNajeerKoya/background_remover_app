import 'package:background_remover_app/presentation/feature/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/units.dart';
import '../../../../generated/app_icons.dart';
import '../../../../shared/helper_functions/custom_svg_icon.dart';
import '../../home/bloc/home_bloc.dart';

class SwipeToGetStartedWidget extends StatefulWidget {
  final double maxDrag;
  final HomeBloc homeBloc;
  final String title;
  final VoidCallback onSlideComplete; // dynamic outcome

  const SwipeToGetStartedWidget({
    super.key,
    this.maxDrag = 300.0,
    required this.homeBloc,
    required this.title,
    required this.onSlideComplete,
  });

  @override
  State<SwipeToGetStartedWidget> createState() => _SwipeToGetStartedWidgetState();
}

class _SwipeToGetStartedWidgetState extends State<SwipeToGetStartedWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isDragging = false;
  VoidCallback? _onComplete;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3500));

    _animation = Tween<double>(begin: 0, end: 0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        widget.homeBloc.updateDragX(_animation.value);
      });

    // Add ONE status listener only
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && _onComplete != null) {
        _onComplete!();
        _onComplete = null;
      }
    });
  }

  void _animateTo(double from, double to, {VoidCallback? onComplete}) {
    _onComplete = onComplete; // set callback for this run
    _animation = Tween<double>(
      begin: from,
      end: to,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller
      ..reset()
      ..forward();
  }

  void _animateToEnd() {
    _animateTo(
      widget.homeBloc.state.dragX,
      widget.maxDrag,
      onComplete: () {
        widget.homeBloc.onSwipeEnd(widget.maxDrag);
        widget.onSlideComplete();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: widget.homeBloc,
      buildWhen: (prev, curr) => prev.dragX != curr.dragX || prev.sliderCompleted != curr.sliderCompleted,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: 63.h,
            width: widget.maxDrag + 60.w,
            child: Stack(
              children: [
                // Background
                Container(
                  height: 60.h,
                  width: double.infinity,
                  padding: leftPadding12,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: sliderButtonBackgroundGradient,
                    ),
                    borderRadius: BorderRadius.circular(40.r),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                  ),
                  alignment: Alignment.center,
                  child: Text(widget.title, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
                ),

                Positioned(
                  right: 18.h,
                  top: 20.h,
                  child: SizedBox(
                    height: 20.h,
                    width: 60.w,
                    child: CustomSvgIcon(
                      AppIcons.kSwiperBgArrows,
                      // color: AppColors.kHomeBorderGoldColor,
                      // height: 20.h, // force bigger size
                      // width: 20.w,
                    ),
                  ),
                ),

                // Swipe button
                Positioned(
                  top: 2.h,
                  left: state.dragX + 2.w,
                  child: GestureDetector(
                    onTap: () {
                      if (!state.sliderCompleted) {
                        _animateToEnd();
                      }
                    },
                    onHorizontalDragUpdate: (details) {
                      _isDragging = true;
                      double newX = widget.homeBloc.state.dragX + details.delta.dx;

                      if (widget.homeBloc.state.sliderCompleted) {
                        double minAllowedX = widget.maxDrag - (widget.maxDrag / 5.w);
                        newX = newX.clamp(minAllowedX, widget.maxDrag);
                      } else {
                        newX = newX.clamp(0.0, widget.maxDrag);
                      }

                      widget.homeBloc.updateDragX(newX);
                    },
                    onHorizontalDragEnd: (_) {
                      if (_isDragging) {
                        _isDragging = false;
                        final currentX = widget.homeBloc.state.dragX;

                        if (currentX <= widget.maxDrag * 0.2) {
                          _animateTo(currentX, 0.0);
                        } else {
                          _animateToEnd();
                        }
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      height: 57.h,
                      width: 57.w,
                      padding: allPadding20,
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(40.r)),
                      child: CustomSvgIcon(
                        AppIcons.kDoubleArrowMark,
                        color: AppColors.kHomeBorderGoldColor,
                        height: 20.h, // force bigger size
                        width: 20.w,
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
  }
}
