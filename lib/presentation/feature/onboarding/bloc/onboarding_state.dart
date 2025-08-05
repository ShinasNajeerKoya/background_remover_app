import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';
part 'onboarding_state.g.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(false) bool error,
    @Default(false) bool isLoading,
    @Default(false) bool isCompleted,
    @Default(false) bool sliderCompleted,
    @Default(0.0) double dragX,
    // @Default(false) bool sliderAtStart,
    @Default(0) int currentTab,
  }) = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) => _$OnboardingStateFromJson(json);
}
