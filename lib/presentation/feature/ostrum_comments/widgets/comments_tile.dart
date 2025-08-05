import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/units.dart';
import '../../../../domain/models/comment/comment_model.dart';
import '../../../widgets/my_text.dart';

class CommentsTile extends StatelessWidget {
  const CommentsTile({super.key, required this.comment});

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    final commentId = '${comment.id ?? 0}';
    final commentName = comment.name ?? 'No name';
    final commentEmail = comment.email ?? 'No email';
    final commentBody = comment.body ?? 'No body';

    return Container(
      key: ValueKey('commentTile_${comment.id}'),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      margin: EdgeInsets.only(bottom: 12.h, left: 12.w, right: 12.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: Colors.white),
      child: Column(
        spacing: 4.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 12.w,
            children: [
              Container(
                key: ValueKey('commentIdCircle_${comment.id}'),
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: AppColors.kCreamBackgroundColor,
                ),
                child: Center(child: MyText(commentId, fontSize: 16.sp, fontColor: Colors.black)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2.h,

                  children: [
                    MyText(commentName, fontSize: 16.sp),
                    MyText(commentEmail, fontSize: 12.sp, fontColor: Colors.brown.shade200),
                  ],
                ),
              ),
            ],
          ),
          verticalMargin8,
          MyText(commentBody, key: ValueKey('commentBody_${comment.id}'), fontSize: 12.sp, maxLines: 5),
        ],
      ),
    );
  }
}
