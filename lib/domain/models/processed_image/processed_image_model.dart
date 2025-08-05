import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'processed_image_model.freezed.dart';
part 'processed_image_model.g.dart';

/// Model representing a processed image with background removed
///
/// Contains both original and processed image data along with metadata
@freezed
abstract class ProcessedImageModel with _$ProcessedImageModel {
  const factory ProcessedImageModel({
    /// Original image file path
    @JsonKey(name: 'originalImagePath') required String originalImagePath,

    /// Processed image file path with background removed
    @JsonKey(name: 'processedImagePath') required String processedImagePath,

    /// Background color applied (if any)
    @JsonKey(name: 'backgroundColor') String? backgroundColor,

    /// Processing timestamp
    @JsonKey(name: 'processedAt') required DateTime processedAt,

    /// File size of processed image in bytes
    @JsonKey(name: 'processedFileSize') required int processedFileSize,

    /// Processing duration in milliseconds
    @JsonKey(name: 'processingDuration') required int processingDuration,
  }) = _ProcessedImageModel;

  factory ProcessedImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProcessedImageModelFromJson(json);

  factory ProcessedImageModel.fromFiles({
    required File originalImage,
    required File processedImage,
    String? backgroundColor,
    required DateTime processedAt,
    required int processedFileSize,
    required int processingDuration,
  }) {
    return ProcessedImageModel(
      originalImagePath: originalImage.path,
      processedImagePath: processedImage.path,
      backgroundColor: backgroundColor,
      processedAt: processedAt,
      processedFileSize: processedFileSize,
      processingDuration: processingDuration,
    );
  }
}

