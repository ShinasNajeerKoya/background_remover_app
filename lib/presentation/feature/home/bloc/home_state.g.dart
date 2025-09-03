// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeState _$HomeStateFromJson(Map<String, dynamic> json) => _HomeState(
  isLoading: json['isLoading'] as bool? ?? false,
  error: json['error'] as bool? ?? false,
  errorMessage: json['errorMessage'] as String? ?? '',
  hasPermission: json['hasPermission'] as bool? ?? false,
  isProcessing: json['isProcessing'] as bool? ?? false,
  isSaving: json['isSaving'] as bool? ?? false,
  isRemovingBackground: json['isRemovingBackground'] as bool? ?? false,
  processedImage:
      json['processedImage'] == null
          ? null
          : ProcessedImageModel.fromJson(
            json['processedImage'] as Map<String, dynamic>,
          ),
  selectedBackgroundColor:
      $enumDecodeNullable(
        _$BackgroundColorOptionEnumMap,
        json['selectedBackgroundColor'],
      ) ??
      BackgroundColorOption.black,
  showBackgroundColorPicker:
      json['showBackgroundColorPicker'] as bool? ?? false,
  processingProgress: (json['processingProgress'] as num?)?.toInt() ?? 0,
  isCompleted: json['isCompleted'] as bool? ?? false,
  sliderCompleted: json['sliderCompleted'] as bool? ?? false,
  dragX: (json['dragX'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$HomeStateToJson(_HomeState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'error': instance.error,
      'errorMessage': instance.errorMessage,
      'hasPermission': instance.hasPermission,
      'isProcessing': instance.isProcessing,
      'isSaving': instance.isSaving,
      'isRemovingBackground': instance.isRemovingBackground,
      'processedImage': instance.processedImage,
      'selectedBackgroundColor':
          _$BackgroundColorOptionEnumMap[instance.selectedBackgroundColor]!,
      'showBackgroundColorPicker': instance.showBackgroundColorPicker,
      'processingProgress': instance.processingProgress,
      'isCompleted': instance.isCompleted,
      'sliderCompleted': instance.sliderCompleted,
      'dragX': instance.dragX,
    };

const _$BackgroundColorOptionEnumMap = {
  BackgroundColorOption.black: 'black',
  BackgroundColorOption.red: 'red',
  BackgroundColorOption.green: 'green',
  BackgroundColorOption.blue: 'blue',
  BackgroundColorOption.yellow: 'yellow',
  BackgroundColorOption.purple: 'purple',
  BackgroundColorOption.transparent: 'transparent',
};
