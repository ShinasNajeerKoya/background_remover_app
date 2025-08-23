import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:background_remover_app/domain/repositories/onboarding/onboarding_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:background_remover_app/shared/mixins/safe_emit_mixin/safe_emit_mixin.dart';

import 'onboarding_state.dart';

class OnboardingBloc extends Cubit<OnboardingState> with SafeEmitMixin<OnboardingState> {
  OnboardingBloc(this._repo) : super(const OnboardingState());

  final OnboardingRepository _repo;
  Future<void> completeOnboardingFlow() async {
    safeEmit(state.copyWith(isLoading: true));
    try {
      await _repo.completeOnboarding();
      safeEmit(state.copyWith(isCompleted: true, isLoading: false));
    } catch (_) {
      safeEmit(state.copyWith(isLoading: false, error: true));
    }
  }

  void changeTab(int tabIndex) {
    safeEmit(state.copyWith(currentTab: tabIndex));
  }

  void completeSlider() {
    // Trigger some action or log
    debugPrint('Slider successful');
  }

  void onSwipeUpdate(double delta, double maxDrag) {
    final newX = (state.dragX + delta).clamp(0.0, maxDrag);
    safeEmit(state.copyWith(dragX: newX));
  }

  void updateDragX(double x) {
    safeEmit(state.copyWith(dragX: x));
  }

  // void onSwipeEnd(double maxDrag) {
  //   if (!state.sliderCompleted && state.dragX >= maxDrag) {
  //     log('slide completed');
  //     safeEmit(state.copyWith(sliderCompleted: true));
  //     completeOnboardingFlow();
  //   }
  // }
}
