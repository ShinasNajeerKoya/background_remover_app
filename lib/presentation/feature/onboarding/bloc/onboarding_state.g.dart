// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) =>
    _OnboardingState(
      error: json['error'] as bool? ?? false,
      isLoading: json['isLoading'] as bool? ?? false,
      isCompleted: json['isCompleted'] as bool? ?? false,
      sliderCompleted: json['sliderCompleted'] as bool? ?? false,
      dragX: (json['dragX'] as num?)?.toDouble() ?? 0.0,
      currentTab: (json['currentTab'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$OnboardingStateToJson(_OnboardingState instance) =>
    <String, dynamic>{
      'error': instance.error,
      'isLoading': instance.isLoading,
      'isCompleted': instance.isCompleted,
      'sliderCompleted': instance.sliderCompleted,
      'dragX': instance.dragX,
      'currentTab': instance.currentTab,
    };
