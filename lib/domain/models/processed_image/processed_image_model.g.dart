// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processed_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProcessedImageModel _$ProcessedImageModelFromJson(Map<String, dynamic> json) =>
    _ProcessedImageModel(
      originalImagePath: json['originalImagePath'] as String,
      processedImagePath: json['processedImagePath'] as String,
      backgroundColor: json['backgroundColor'] as String?,
      processedAt: DateTime.parse(json['processedAt'] as String),
      processedFileSize: (json['processedFileSize'] as num).toInt(),
      processingDuration: (json['processingDuration'] as num).toInt(),
    );

Map<String, dynamic> _$ProcessedImageModelToJson(
  _ProcessedImageModel instance,
) => <String, dynamic>{
  'originalImagePath': instance.originalImagePath,
  'processedImagePath': instance.processedImagePath,
  'backgroundColor': instance.backgroundColor,
  'processedAt': instance.processedAt.toIso8601String(),
  'processedFileSize': instance.processedFileSize,
  'processingDuration': instance.processingDuration,
};
