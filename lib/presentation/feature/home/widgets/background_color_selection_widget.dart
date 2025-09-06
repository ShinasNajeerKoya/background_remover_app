import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../utils/background_color_enum.dart';

class BackgroundColorSelectionWidget extends StatelessWidget {
  const BackgroundColorSelectionWidget({super.key, required this.homeBloc, required this.state});

  final HomeBloc homeBloc;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.w,
      children:
      BackgroundColorOption.values.map((option) {
        final color = option.color;
        final isSelected = state.selectedBackgroundColor == option;

        return GestureDetector(
          onTap: () {
            homeBloc.changeBackgroundColor(option);
            homeBloc.saveSelectedImage(backgroundColor: color);
          },
          child: Stack(
            children: [
              Container(
                width: 50.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: color == Colors.transparent ? Colors.grey.shade300 : color,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              // ✅ Overlay when selected
              if (isSelected)
                Container(
                  width: 50.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              if (isSelected)
                SizedBox(
                  width: 50.w,
                  height: 80.h,
                  child: Center(
                    child: Icon(CupertinoIcons.check_mark_circled_solid, color: AppColors.kPrimaryGoldColor),
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
