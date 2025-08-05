import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get_it/get_it.dart' show GetIt;
import 'package:background_remover_app/domain/models/comment/comment_model.dart';
import 'package:background_remover_app/presentation/feature/ostrum_comments/bloc/ostrum_comments_bloc.dart';
import 'package:background_remover_app/presentation/feature/ostrum_comments/bloc/ostrum_comments_state.dart';
import 'package:background_remover_app/presentation/widgets/my_text.dart';
import 'package:tuple/tuple.dart';

import '../../../../config/themes/colors.dart';
import '../../../../shared/helper_functions/debouncer_helper/debouncer_helper.dart';
import '../widgets/comment_floating_action_button.dart';
import '../widgets/comments_tile.dart';
import '../widgets/loading_comment_tile.dart';

@RoutePage()
class OstrumCommentsPage extends StatefulWidget {
  static const id = '/ostrumCommentsPage';
  const OstrumCommentsPage({super.key});

  @override
  State<OstrumCommentsPage> createState() => _OstrumCommentsPageState();
}

class _OstrumCommentsPageState extends State<OstrumCommentsPage> {
  final ostrumCommentsBloc = GetIt.I<OstrumCommentsBloc>();

  final DebouncerHelper _getDebouncer = DebouncerHelper(milliseconds: 500);

  @override
  void dispose() {
    _getDebouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kCreamBackgroundColor,

      body: SafeArea(
        child: BlocSelector<OstrumCommentsBloc, OstrumCommentsState, Tuple3<bool, bool, List<CommentModel>>>(
          bloc: ostrumCommentsBloc,
          selector: (state) => Tuple3(state.isLoading, state.error, state.comments),
          builder: (context, tuple) {
            final isLoading = tuple.item1;
            final hasError = tuple.item2;
            final comments = tuple.item3;

            if (isLoading) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                itemCount: 6,
                itemBuilder: (context, index) => const LoadingCommentTile(),
              );
            }

            if (hasError) {
              return const Center(child: MyText('Something went wrong while loading comments.', fontColor: Colors.red));
            }

            if (comments.isEmpty) {
              return const Center(child: MyText("Welcome, Please load the data"));
            }

            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];

                return CommentsTile(comment: comment);
              },
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 12.h),
        child: CommentFloatingActionButton(ostrumCommentsBloc: ostrumCommentsBloc, getDebouncer: _getDebouncer),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
