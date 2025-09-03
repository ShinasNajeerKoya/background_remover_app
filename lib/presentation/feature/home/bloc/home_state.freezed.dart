// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState {

 bool get isLoading; bool get error; String get errorMessage; bool get hasPermission; bool get isProcessing; bool get isSaving; bool get isRemovingBackground;/// Original picked image (raw)
@JsonKey(includeFromJson: false, includeToJson: false) File? get selectedImage;/// Working image (cropped/edited, but not saved yet)
@JsonKey(includeFromJson: false, includeToJson: false) File? get homeSelectedImage;/// Final processed image (after Save)
 ProcessedImageModel? get processedImage; BackgroundColorOption get selectedBackgroundColor; bool get showBackgroundColorPicker; int get processingProgress; bool get isCompleted; bool get sliderCompleted; double get dragX;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);

  /// Serializes this HomeState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.hasPermission, hasPermission) || other.hasPermission == hasPermission)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isRemovingBackground, isRemovingBackground) || other.isRemovingBackground == isRemovingBackground)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&(identical(other.homeSelectedImage, homeSelectedImage) || other.homeSelectedImage == homeSelectedImage)&&(identical(other.processedImage, processedImage) || other.processedImage == processedImage)&&(identical(other.selectedBackgroundColor, selectedBackgroundColor) || other.selectedBackgroundColor == selectedBackgroundColor)&&(identical(other.showBackgroundColorPicker, showBackgroundColorPicker) || other.showBackgroundColorPicker == showBackgroundColorPicker)&&(identical(other.processingProgress, processingProgress) || other.processingProgress == processingProgress)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.sliderCompleted, sliderCompleted) || other.sliderCompleted == sliderCompleted)&&(identical(other.dragX, dragX) || other.dragX == dragX));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLoading,error,errorMessage,hasPermission,isProcessing,isSaving,isRemovingBackground,selectedImage,homeSelectedImage,processedImage,selectedBackgroundColor,showBackgroundColorPicker,processingProgress,isCompleted,sliderCompleted,dragX);

@override
String toString() {
  return 'HomeState(isLoading: $isLoading, error: $error, errorMessage: $errorMessage, hasPermission: $hasPermission, isProcessing: $isProcessing, isSaving: $isSaving, isRemovingBackground: $isRemovingBackground, selectedImage: $selectedImage, homeSelectedImage: $homeSelectedImage, processedImage: $processedImage, selectedBackgroundColor: $selectedBackgroundColor, showBackgroundColorPicker: $showBackgroundColorPicker, processingProgress: $processingProgress, isCompleted: $isCompleted, sliderCompleted: $sliderCompleted, dragX: $dragX)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool error, String errorMessage, bool hasPermission, bool isProcessing, bool isSaving, bool isRemovingBackground,@JsonKey(includeFromJson: false, includeToJson: false) File? selectedImage,@JsonKey(includeFromJson: false, includeToJson: false) File? homeSelectedImage, ProcessedImageModel? processedImage, BackgroundColorOption selectedBackgroundColor, bool showBackgroundColorPicker, int processingProgress, bool isCompleted, bool sliderCompleted, double dragX
});


$ProcessedImageModelCopyWith<$Res>? get processedImage;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? error = null,Object? errorMessage = null,Object? hasPermission = null,Object? isProcessing = null,Object? isSaving = null,Object? isRemovingBackground = null,Object? selectedImage = freezed,Object? homeSelectedImage = freezed,Object? processedImage = freezed,Object? selectedBackgroundColor = null,Object? showBackgroundColorPicker = null,Object? processingProgress = null,Object? isCompleted = null,Object? sliderCompleted = null,Object? dragX = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,hasPermission: null == hasPermission ? _self.hasPermission : hasPermission // ignore: cast_nullable_to_non_nullable
as bool,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isRemovingBackground: null == isRemovingBackground ? _self.isRemovingBackground : isRemovingBackground // ignore: cast_nullable_to_non_nullable
as bool,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as File?,homeSelectedImage: freezed == homeSelectedImage ? _self.homeSelectedImage : homeSelectedImage // ignore: cast_nullable_to_non_nullable
as File?,processedImage: freezed == processedImage ? _self.processedImage : processedImage // ignore: cast_nullable_to_non_nullable
as ProcessedImageModel?,selectedBackgroundColor: null == selectedBackgroundColor ? _self.selectedBackgroundColor : selectedBackgroundColor // ignore: cast_nullable_to_non_nullable
as BackgroundColorOption,showBackgroundColorPicker: null == showBackgroundColorPicker ? _self.showBackgroundColorPicker : showBackgroundColorPicker // ignore: cast_nullable_to_non_nullable
as bool,processingProgress: null == processingProgress ? _self.processingProgress : processingProgress // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,sliderCompleted: null == sliderCompleted ? _self.sliderCompleted : sliderCompleted // ignore: cast_nullable_to_non_nullable
as bool,dragX: null == dragX ? _self.dragX : dragX // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProcessedImageModelCopyWith<$Res>? get processedImage {
    if (_self.processedImage == null) {
    return null;
  }

  return $ProcessedImageModelCopyWith<$Res>(_self.processedImage!, (value) {
    return _then(_self.copyWith(processedImage: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool error,  String errorMessage,  bool hasPermission,  bool isProcessing,  bool isSaving,  bool isRemovingBackground, @JsonKey(includeFromJson: false, includeToJson: false)  File? selectedImage, @JsonKey(includeFromJson: false, includeToJson: false)  File? homeSelectedImage,  ProcessedImageModel? processedImage,  BackgroundColorOption selectedBackgroundColor,  bool showBackgroundColorPicker,  int processingProgress,  bool isCompleted,  bool sliderCompleted,  double dragX)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.isLoading,_that.error,_that.errorMessage,_that.hasPermission,_that.isProcessing,_that.isSaving,_that.isRemovingBackground,_that.selectedImage,_that.homeSelectedImage,_that.processedImage,_that.selectedBackgroundColor,_that.showBackgroundColorPicker,_that.processingProgress,_that.isCompleted,_that.sliderCompleted,_that.dragX);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool error,  String errorMessage,  bool hasPermission,  bool isProcessing,  bool isSaving,  bool isRemovingBackground, @JsonKey(includeFromJson: false, includeToJson: false)  File? selectedImage, @JsonKey(includeFromJson: false, includeToJson: false)  File? homeSelectedImage,  ProcessedImageModel? processedImage,  BackgroundColorOption selectedBackgroundColor,  bool showBackgroundColorPicker,  int processingProgress,  bool isCompleted,  bool sliderCompleted,  double dragX)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.isLoading,_that.error,_that.errorMessage,_that.hasPermission,_that.isProcessing,_that.isSaving,_that.isRemovingBackground,_that.selectedImage,_that.homeSelectedImage,_that.processedImage,_that.selectedBackgroundColor,_that.showBackgroundColorPicker,_that.processingProgress,_that.isCompleted,_that.sliderCompleted,_that.dragX);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool error,  String errorMessage,  bool hasPermission,  bool isProcessing,  bool isSaving,  bool isRemovingBackground, @JsonKey(includeFromJson: false, includeToJson: false)  File? selectedImage, @JsonKey(includeFromJson: false, includeToJson: false)  File? homeSelectedImage,  ProcessedImageModel? processedImage,  BackgroundColorOption selectedBackgroundColor,  bool showBackgroundColorPicker,  int processingProgress,  bool isCompleted,  bool sliderCompleted,  double dragX)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.isLoading,_that.error,_that.errorMessage,_that.hasPermission,_that.isProcessing,_that.isSaving,_that.isRemovingBackground,_that.selectedImage,_that.homeSelectedImage,_that.processedImage,_that.selectedBackgroundColor,_that.showBackgroundColorPicker,_that.processingProgress,_that.isCompleted,_that.sliderCompleted,_that.dragX);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeState implements HomeState {
  const _HomeState({this.isLoading = false, this.error = false, this.errorMessage = '', this.hasPermission = false, this.isProcessing = false, this.isSaving = false, this.isRemovingBackground = false, @JsonKey(includeFromJson: false, includeToJson: false) this.selectedImage, @JsonKey(includeFromJson: false, includeToJson: false) this.homeSelectedImage, this.processedImage, this.selectedBackgroundColor = BackgroundColorOption.black, this.showBackgroundColorPicker = false, this.processingProgress = 0, this.isCompleted = false, this.sliderCompleted = false, this.dragX = 0.0});
  factory _HomeState.fromJson(Map<String, dynamic> json) => _$HomeStateFromJson(json);

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool error;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  bool hasPermission;
@override@JsonKey() final  bool isProcessing;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  bool isRemovingBackground;
/// Original picked image (raw)
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? selectedImage;
/// Working image (cropped/edited, but not saved yet)
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? homeSelectedImage;
/// Final processed image (after Save)
@override final  ProcessedImageModel? processedImage;
@override@JsonKey() final  BackgroundColorOption selectedBackgroundColor;
@override@JsonKey() final  bool showBackgroundColorPicker;
@override@JsonKey() final  int processingProgress;
@override@JsonKey() final  bool isCompleted;
@override@JsonKey() final  bool sliderCompleted;
@override@JsonKey() final  double dragX;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.hasPermission, hasPermission) || other.hasPermission == hasPermission)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isRemovingBackground, isRemovingBackground) || other.isRemovingBackground == isRemovingBackground)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&(identical(other.homeSelectedImage, homeSelectedImage) || other.homeSelectedImage == homeSelectedImage)&&(identical(other.processedImage, processedImage) || other.processedImage == processedImage)&&(identical(other.selectedBackgroundColor, selectedBackgroundColor) || other.selectedBackgroundColor == selectedBackgroundColor)&&(identical(other.showBackgroundColorPicker, showBackgroundColorPicker) || other.showBackgroundColorPicker == showBackgroundColorPicker)&&(identical(other.processingProgress, processingProgress) || other.processingProgress == processingProgress)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.sliderCompleted, sliderCompleted) || other.sliderCompleted == sliderCompleted)&&(identical(other.dragX, dragX) || other.dragX == dragX));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLoading,error,errorMessage,hasPermission,isProcessing,isSaving,isRemovingBackground,selectedImage,homeSelectedImage,processedImage,selectedBackgroundColor,showBackgroundColorPicker,processingProgress,isCompleted,sliderCompleted,dragX);

@override
String toString() {
  return 'HomeState(isLoading: $isLoading, error: $error, errorMessage: $errorMessage, hasPermission: $hasPermission, isProcessing: $isProcessing, isSaving: $isSaving, isRemovingBackground: $isRemovingBackground, selectedImage: $selectedImage, homeSelectedImage: $homeSelectedImage, processedImage: $processedImage, selectedBackgroundColor: $selectedBackgroundColor, showBackgroundColorPicker: $showBackgroundColorPicker, processingProgress: $processingProgress, isCompleted: $isCompleted, sliderCompleted: $sliderCompleted, dragX: $dragX)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool error, String errorMessage, bool hasPermission, bool isProcessing, bool isSaving, bool isRemovingBackground,@JsonKey(includeFromJson: false, includeToJson: false) File? selectedImage,@JsonKey(includeFromJson: false, includeToJson: false) File? homeSelectedImage, ProcessedImageModel? processedImage, BackgroundColorOption selectedBackgroundColor, bool showBackgroundColorPicker, int processingProgress, bool isCompleted, bool sliderCompleted, double dragX
});


@override $ProcessedImageModelCopyWith<$Res>? get processedImage;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? error = null,Object? errorMessage = null,Object? hasPermission = null,Object? isProcessing = null,Object? isSaving = null,Object? isRemovingBackground = null,Object? selectedImage = freezed,Object? homeSelectedImage = freezed,Object? processedImage = freezed,Object? selectedBackgroundColor = null,Object? showBackgroundColorPicker = null,Object? processingProgress = null,Object? isCompleted = null,Object? sliderCompleted = null,Object? dragX = null,}) {
  return _then(_HomeState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,hasPermission: null == hasPermission ? _self.hasPermission : hasPermission // ignore: cast_nullable_to_non_nullable
as bool,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isRemovingBackground: null == isRemovingBackground ? _self.isRemovingBackground : isRemovingBackground // ignore: cast_nullable_to_non_nullable
as bool,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as File?,homeSelectedImage: freezed == homeSelectedImage ? _self.homeSelectedImage : homeSelectedImage // ignore: cast_nullable_to_non_nullable
as File?,processedImage: freezed == processedImage ? _self.processedImage : processedImage // ignore: cast_nullable_to_non_nullable
as ProcessedImageModel?,selectedBackgroundColor: null == selectedBackgroundColor ? _self.selectedBackgroundColor : selectedBackgroundColor // ignore: cast_nullable_to_non_nullable
as BackgroundColorOption,showBackgroundColorPicker: null == showBackgroundColorPicker ? _self.showBackgroundColorPicker : showBackgroundColorPicker // ignore: cast_nullable_to_non_nullable
as bool,processingProgress: null == processingProgress ? _self.processingProgress : processingProgress // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,sliderCompleted: null == sliderCompleted ? _self.sliderCompleted : sliderCompleted // ignore: cast_nullable_to_non_nullable
as bool,dragX: null == dragX ? _self.dragX : dragX // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProcessedImageModelCopyWith<$Res>? get processedImage {
    if (_self.processedImage == null) {
    return null;
  }

  return $ProcessedImageModelCopyWith<$Res>(_self.processedImage!, (value) {
    return _then(_self.copyWith(processedImage: value));
  });
}
}

// dart format on
