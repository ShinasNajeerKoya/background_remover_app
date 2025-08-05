import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../shared/helper_functions/future_try_catch_helper/future_try_catch_helper.dart';
import '../../../../shared/mixins/safe_emit_mixin/safe_emit_mixin.dart';
import 'ostrum_comments_state.dart';
import 'package:background_remover_app/domain/repositories/ostrum_comments/ostrum_comments_repository.dart';

class OstrumCommentsBloc extends HydratedCubit<OstrumCommentsState> with SafeHydratedEmitMixin<OstrumCommentsState> {
  OstrumCommentsBloc(this._repo) : super(const OstrumCommentsState());

  final OstrumCommentsRepository _repo;

  Future<void> fetchOstrumComments() async {
    safeEmit(state.copyWith(isLoading: true));

    await futureTryCatch(
      () async {
        final data = await _repo.fetchComments();
        safeEmit(state.copyWith(isLoading: false, comments: data));
      },
      onError: (error) {
        safeEmit(state.copyWith(error: true, isLoading: false));
      },
    );
  }

  // void reset() {
  //   safeEmit(const OstrumCommentsState());
  // }

  /// Clear cached hydrated state
  Future<void> clearCache() async {
    safeEmit(state.copyWith(isLoading: true));

    await futureTryCatch(
      () async {
        await HydratedBloc.storage.delete('OstrumCommentsBloc');
        safeEmit(state.copyWith(isLoading: false, comments: []));
      },
      onError: (error) {
        safeEmit(state.copyWith(error: true, isLoading: false));
      },
    );
  }

  @override
  OstrumCommentsState fromJson(Map<String, dynamic> json) => OstrumCommentsState.fromJson(json);

  @override
  Map<String, dynamic> toJson(OstrumCommentsState state) => state.toJson();
}
