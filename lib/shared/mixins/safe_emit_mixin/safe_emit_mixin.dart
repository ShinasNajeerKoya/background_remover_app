import 'package:hydrated_bloc/hydrated_bloc.dart';

mixin SafeHydratedEmitMixin<State> on HydratedCubit<State> {
  void safeEmit(State newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}

mixin SafeEmitMixin<State> on Cubit<State> {
  void safeEmit(State newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
