import 'package:auto_route/auto_route.dart';
import 'package:background_remover_app/presentation/feature/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/units.dart';
import '../../../../core/routes/route_config.gr.dart';
import '../../../../generated/app_icons.dart';
import '../../../../shared/helper_functions/custom_svg_icon.dart';
import '../../home/bloc/home_bloc.dart';
class SwipeToGetStartedWidget extends StatefulWidget {
  final double maxDrag;
  final HomeBloc homeBloc;

  const SwipeToGetStartedWidget({super.key, this.maxDrag = 200.0, required this.homeBloc});

  @override
  State<SwipeToGetStartedWidget> createState() => _SwipeToGetStartedWidgetState();
}

class _SwipeToGetStartedWidgetState extends State<SwipeToGetStartedWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  void _animateToEnd() {
    final currentX = widget.homeBloc.state.dragX;
    final distanceLeft = widget.maxDrag - currentX;

    _controller.reset();
    final tween = Tween<double>(begin: currentX, end: widget.maxDrag);

    _animation =
        tween.animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
          ..addListener(() {
            widget.homeBloc.updateDragX(_animation.value);
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              widget.homeBloc.onSwipeEnd(widget.maxDrag);
            }
          });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: widget.homeBloc,
      buildWhen: (prev, curr) => prev.dragX != curr.dragX || prev.sliderCompleted != curr.sliderCompleted,
      builder: (context, state) {
        if (state.sliderCompleted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.router.replaceAll([HomeRoute()]);
          });
        }

        return SizedBox(
          height: 60.h,
          width: widget.maxDrag + 60.w,
          child: Stack(
            children: [
              // Background container
              Container(
                height: 60.h,
                width: double.infinity,
                padding: leftPadding40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                ),
                alignment: Alignment.center,
                child: Text('swipe to get started', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
              ),

              // Swipe button
              Positioned(
                top: 6.h,
                left: state.dragX + 6.w,
                child: GestureDetector(
                  onTap: () {
                    if (!state.sliderCompleted) {
                      _animateToEnd();
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    _isDragging = true;
                    double newX = widget.homeBloc.state.dragX + details.delta.dx;

                    // Limit backward drag after reaching max drag
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

                      // If near start, slide back to zero
                      if (currentX <= widget.maxDrag * 0.2) {
                        final tween = Tween<double>(begin: currentX, end: 0.0);
                        _controller.reset();
                        _animation = tween.animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
                          ..addListener(() {
                            widget.homeBloc.updateDragX(_animation.value);
                          });
                        _controller.forward();
                      } else {
                        _animateToEnd();
                      }
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    height: 48.h,
                    width: 48.w,
                    padding: allPadding14,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [BoxShadow(color: Colors.grey.shade400, spreadRadius: 1, blurRadius: 10)],
                    ),
                    child: CustomSvgIcon(AppIcons.kDoubleArrowMark, color: AppColors.kCarousalPrimaryCream),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
