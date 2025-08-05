import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../domain/models/comment/comment_model.dart';
import '../../../../shared/helper_functions/debouncer_helper/debouncer_helper.dart';
import '../../../widgets/my_text.dart';
import '../bloc/ostrum_comments_bloc.dart';
import '../bloc/ostrum_comments_state.dart';

class CommentFloatingActionButton extends StatelessWidget {
  const CommentFloatingActionButton({
    super.key,
    required this.ostrumCommentsBloc,
    required DebouncerHelper getDebouncer,
  }) : _getDebouncer = getDebouncer;

  final OstrumCommentsBloc ostrumCommentsBloc;
  final DebouncerHelper _getDebouncer;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OstrumCommentsBloc, OstrumCommentsState, List<CommentModel>>(
      bloc: ostrumCommentsBloc,
      selector: (state) => state.comments,
      builder: (context, comments) {
        final isEmpty = comments.isEmpty;

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isEmpty ? Colors.white : AppColors.kDisableColor,
              foregroundColor: Colors.black,
              elevation: 1,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
            ),
            onPressed: () {
              _getDebouncer.run(() {
                if (isEmpty) {
                  ostrumCommentsBloc.fetchOstrumComments();
                } else {
                  ostrumCommentsBloc.clearCache();
                }
              });
            },
            child:
            isEmpty ? const MyText('Get Data', fontWeight: FontWeight.w600) : const Icon(CupertinoIcons.delete),
          ),
        );
      },
    );
  }
}
