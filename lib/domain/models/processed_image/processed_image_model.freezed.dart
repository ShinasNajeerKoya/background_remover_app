// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processed_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProcessedImageModel {

/// Original image file path
@JsonKey(name: 'originalImagePath') String get originalImagePath;/// Processed image file path with background removed
@JsonKey(name: 'processedImagePath') String get processedImagePath;/// Background color applied (if any)
@JsonKey(name: 'backgroundColor') String? get backgroundColor;/// Processing timestamp
@JsonKey(name: 'processedAt') DateTime get processedAt;/// File size of processed image in bytes
@JsonKey(name: 'processedFileSize') int get processedFileSize;/// Processing duration in milliseconds
@JsonKey(name: 'processingDuration') int get processingDuration;
/// Create a copy of ProcessedImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessedImageModelCopyWith<ProcessedImageModel> get copyWith => _$ProcessedImageModelCopyWithImpl<ProcessedImageModel>(this as ProcessedImageModel, _$identity);

  /// Serializes this ProcessedImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessedImageModel&&(identical(other.originalImagePath, originalImagePath) || other.originalImagePath == originalImagePath)&&(identical(other.processedImagePath, processedImagePath) || other.processedImagePath == processedImagePath)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.processedAt, processedAt) || other.processedAt == processedAt)&&(identical(other.processedFileSize, processedFileSize) || other.processedFileSize == processedFileSize)&&(identical(other.processingDuration, processingDuration) || other.processingDuration == processingDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,originalImagePath,processedImagePath,backgroundColor,processedAt,processedFileSize,processingDuration);

@override
String toString() {
  return 'ProcessedImageModel(originalImagePath: $originalImagePath, processedImagePath: $processedImagePath, backgroundColor: $backgroundColor, processedAt: $processedAt, processedFileSize: $processedFileSize, processingDuration: $processingDuration)';
}


}

/// @nodoc
abstract mixin class $ProcessedImageModelCopyWith<$Res>  {
  factory $ProcessedImageModelCopyWith(ProcessedImageModel value, $Res Function(ProcessedImageModel) _then) = _$ProcessedImageModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'originalImagePath') String originalImagePath,@JsonKey(name: 'processedImagePath') String processedImagePath,@JsonKey(name: 'backgroundColor') String? backgroundColor,@JsonKey(name: 'processedAt') DateTime processedAt,@JsonKey(name: 'processedFileSize') int processedFileSize,@JsonKey(name: 'processingDuration') int processingDuration
});




}
/// @nodoc
class _$ProcessedImageModelCopyWithImpl<$Res>
    implements $ProcessedImageModelCopyWith<$Res> {
  _$ProcessedImageModelCopyWithImpl(this._self, this._then);

  final ProcessedImageModel _self;
  final $Res Function(ProcessedImageModel) _then;

/// Create a copy of ProcessedImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? originalImagePath = null,Object? processedImagePath = null,Object? backgroundColor = freezed,Object? processedAt = null,Object? processedFileSize = null,Object? processingDuration = null,}) {
  return _then(_self.copyWith(
originalImagePath: null == originalImagePath ? _self.originalImagePath : originalImagePath // ignore: cast_nullable_to_non_nullable
as String,processedImagePath: null == processedImagePath ? _self.processedImagePath : processedImagePath // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String?,processedAt: null == processedAt ? _self.processedAt : processedAt // ignore: cast_nullable_to_non_nullable
as DateTime,processedFileSize: null == processedFileSize ? _self.processedFileSize : processedFileSize // ignore: cast_nullable_to_non_nullable
as int,processingDuration: null == processingDuration ? _self.processingDuration : processingDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessedImageModel].
extension ProcessedImageModelPatterns on ProcessedImageModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessedImageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessedImageModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessedImageModel value)  $default,){
final _that = this;
switch (_that) {
case _ProcessedImageModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessedImageModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessedImageModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'originalImagePath')  String originalImagePath, @JsonKey(name: 'processedImagePath')  String processedImagePath, @JsonKey(name: 'backgroundColor')  String? backgroundColor, @JsonKey(name: 'processedAt')  DateTime processedAt, @JsonKey(name: 'processedFileSize')  int processedFileSize, @JsonKey(name: 'processingDuration')  int processingDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessedImageModel() when $default != null:
return $default(_that.originalImagePath,_that.processedImagePath,_that.backgroundColor,_that.processedAt,_that.processedFileSize,_that.processingDuration);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'originalImagePath')  String originalImagePath, @JsonKey(name: 'processedImagePath')  String processedImagePath, @JsonKey(name: 'backgroundColor')  String? backgroundColor, @JsonKey(name: 'processedAt')  DateTime processedAt, @JsonKey(name: 'processedFileSize')  int processedFileSize, @JsonKey(name: 'processingDuration')  int processingDuration)  $default,) {final _that = this;
switch (_that) {
case _ProcessedImageModel():
return $default(_that.originalImagePath,_that.processedImagePath,_that.backgroundColor,_that.processedAt,_that.processedFileSize,_that.processingDuration);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'originalImagePath')  String originalImagePath, @JsonKey(name: 'processedImagePath')  String processedImagePath, @JsonKey(name: 'backgroundColor')  String? backgroundColor, @JsonKey(name: 'processedAt')  DateTime processedAt, @JsonKey(name: 'processedFileSize')  int processedFileSize, @JsonKey(name: 'processingDuration')  int processingDuration)?  $default,) {final _that = this;
switch (_that) {
case _ProcessedImageModel() when $default != null:
return $default(_that.originalImagePath,_that.processedImagePath,_that.backgroundColor,_that.processedAt,_that.processedFileSize,_that.processingDuration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessedImageModel implements ProcessedImageModel {
  const _ProcessedImageModel({@JsonKey(name: 'originalImagePath') required this.originalImagePath, @JsonKey(name: 'processedImagePath') required this.processedImagePath, @JsonKey(name: 'backgroundColor') this.backgroundColor, @JsonKey(name: 'processedAt') required this.processedAt, @JsonKey(name: 'processedFileSize') required this.processedFileSize, @JsonKey(name: 'processingDuration') required this.processingDuration});
  factory _ProcessedImageModel.fromJson(Map<String, dynamic> json) => _$ProcessedImageModelFromJson(json);

/// Original image file path
@override@JsonKey(name: 'originalImagePath') final  String originalImagePath;
/// Processed image file path with background removed
@override@JsonKey(name: 'processedImagePath') final  String processedImagePath;
/// Background color applied (if any)
@override@JsonKey(name: 'backgroundColor') final  String? backgroundColor;
/// Processing timestamp
@override@JsonKey(name: 'processedAt') final  DateTime processedAt;
/// File size of processed image in bytes
@override@JsonKey(name: 'processedFileSize') final  int processedFileSize;
/// Processing duration in milliseconds
@override@JsonKey(name: 'processingDuration') final  int processingDuration;

/// Create a copy of ProcessedImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessedImageModelCopyWith<_ProcessedImageModel> get copyWith => __$ProcessedImageModelCopyWithImpl<_ProcessedImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessedImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessedImageModel&&(identical(other.originalImagePath, originalImagePath) || other.originalImagePath == originalImagePath)&&(identical(other.processedImagePath, processedImagePath) || other.processedImagePath == processedImagePath)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.processedAt, processedAt) || other.processedAt == processedAt)&&(identical(other.processedFileSize, processedFileSize) || other.processedFileSize == processedFileSize)&&(identical(other.processingDuration, processingDuration) || other.processingDuration == processingDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,originalImagePath,processedImagePath,backgroundColor,processedAt,processedFileSize,processingDuration);

@override
String toString() {
  return 'ProcessedImageModel(originalImagePath: $originalImagePath, processedImagePath: $processedImagePath, backgroundColor: $backgroundColor, processedAt: $processedAt, processedFileSize: $processedFileSize, processingDuration: $processingDuration)';
}


}

/// @nodoc
abstract mixin class _$ProcessedImageModelCopyWith<$Res> implements $ProcessedImageModelCopyWith<$Res> {
  factory _$ProcessedImageModelCopyWith(_ProcessedImageModel value, $Res Function(_ProcessedImageModel) _then) = __$ProcessedImageModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'originalImagePath') String originalImagePath,@JsonKey(name: 'processedImagePath') String processedImagePath,@JsonKey(name: 'backgroundColor') String? backgroundColor,@JsonKey(name: 'processedAt') DateTime processedAt,@JsonKey(name: 'processedFileSize') int processedFileSize,@JsonKey(name: 'processingDuration') int processingDuration
});




}
/// @nodoc
class __$ProcessedImageModelCopyWithImpl<$Res>
    implements _$ProcessedImageModelCopyWith<$Res> {
  __$ProcessedImageModelCopyWithImpl(this._self, this._then);

  final _ProcessedImageModel _self;
  final $Res Function(_ProcessedImageModel) _then;

/// Create a copy of ProcessedImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? originalImagePath = null,Object? processedImagePath = null,Object? backgroundColor = freezed,Object? processedAt = null,Object? processedFileSize = null,Object? processingDuration = null,}) {
  return _then(_ProcessedImageModel(
originalImagePath: null == originalImagePath ? _self.originalImagePath : originalImagePath // ignore: cast_nullable_to_non_nullable
as String,processedImagePath: null == processedImagePath ? _self.processedImagePath : processedImagePath // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String?,processedAt: null == processedAt ? _self.processedAt : processedAt // ignore: cast_nullable_to_non_nullable
as DateTime,processedFileSize: null == processedFileSize ? _self.processedFileSize : processedFileSize // ignore: cast_nullable_to_non_nullable
as int,processingDuration: null == processingDuration ? _self.processingDuration : processingDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
