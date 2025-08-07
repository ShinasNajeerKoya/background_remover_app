import 'dart:io';
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/processed_image/processed_image_model.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool error,
    @Default('') String errorMessage,
    @Default(false) bool hasPermission,
    @Default(false) bool isProcessing,
    @Default(false) bool isSaving,
    @JsonKey(includeFromJson: false, includeToJson: false) File? selectedImage,
    ProcessedImageModel? processedImage,
    @JsonKey(includeFromJson: false, includeToJson: false) Color? selectedBackgroundColor,
    @Default(false) bool showBackgroundColorPicker,
    @Default(0) int processingProgress,

    @Default(false) bool isCompleted,
    @Default(false) bool sliderCompleted,
    @Default(0.0) double dragX,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}


extension HomeStateX on HomeState {
  /// Check if an image is selected
  bool get hasSelectedImage => selectedImage != null;

  /// Check if image is processed
  bool get hasProcessedImage => processedImage != null;

  /// Check if ready to save
  bool get canSave => hasProcessedImage && hasPermission && !isSaving;

  /// Check if ready to process
  bool get canProcess => hasSelectedImage && !isProcessing;
}