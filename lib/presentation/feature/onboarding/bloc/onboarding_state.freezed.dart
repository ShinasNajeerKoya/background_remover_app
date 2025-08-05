// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnboardingState {

 bool get error; bool get isLoading; bool get isCompleted; bool get sliderCompleted; double get dragX;// @Default(false) bool sliderAtStart,
 int get currentTab;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);

  /// Serializes this OnboardingState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.sliderCompleted, sliderCompleted) || other.sliderCompleted == sliderCompleted)&&(identical(other.dragX, dragX) || other.dragX == dragX)&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,isLoading,isCompleted,sliderCompleted,dragX,currentTab);

@override
String toString() {
  return 'OnboardingState(error: $error, isLoading: $isLoading, isCompleted: $isCompleted, sliderCompleted: $sliderCompleted, dragX: $dragX, currentTab: $currentTab)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 bool error, bool isLoading, bool isCompleted, bool sliderCompleted, double dragX, int currentTab
});




}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? isLoading = null,Object? isCompleted = null,Object? sliderCompleted = null,Object? dragX = null,Object? currentTab = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,sliderCompleted: null == sliderCompleted ? _self.sliderCompleted : sliderCompleted // ignore: cast_nullable_to_non_nullable
as bool,dragX: null == dragX ? _self.dragX : dragX // ignore: cast_nullable_to_non_nullable
as double,currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool error,  bool isLoading,  bool isCompleted,  bool sliderCompleted,  double dragX,  int currentTab)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.error,_that.isLoading,_that.isCompleted,_that.sliderCompleted,_that.dragX,_that.currentTab);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool error,  bool isLoading,  bool isCompleted,  bool sliderCompleted,  double dragX,  int currentTab)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.error,_that.isLoading,_that.isCompleted,_that.sliderCompleted,_that.dragX,_that.currentTab);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool error,  bool isLoading,  bool isCompleted,  bool sliderCompleted,  double dragX,  int currentTab)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.error,_that.isLoading,_that.isCompleted,_that.sliderCompleted,_that.dragX,_that.currentTab);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OnboardingState implements OnboardingState {
  const _OnboardingState({this.error = false, this.isLoading = false, this.isCompleted = false, this.sliderCompleted = false, this.dragX = 0.0, this.currentTab = 0});
  factory _OnboardingState.fromJson(Map<String, dynamic> json) => _$OnboardingStateFromJson(json);

@override@JsonKey() final  bool error;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isCompleted;
@override@JsonKey() final  bool sliderCompleted;
@override@JsonKey() final  double dragX;
// @Default(false) bool sliderAtStart,
@override@JsonKey() final  int currentTab;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnboardingStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.sliderCompleted, sliderCompleted) || other.sliderCompleted == sliderCompleted)&&(identical(other.dragX, dragX) || other.dragX == dragX)&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,isLoading,isCompleted,sliderCompleted,dragX,currentTab);

@override
String toString() {
  return 'OnboardingState(error: $error, isLoading: $isLoading, isCompleted: $isCompleted, sliderCompleted: $sliderCompleted, dragX: $dragX, currentTab: $currentTab)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 bool error, bool isLoading, bool isCompleted, bool sliderCompleted, double dragX, int currentTab
});




}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? isLoading = null,Object? isCompleted = null,Object? sliderCompleted = null,Object? dragX = null,Object? currentTab = null,}) {
  return _then(_OnboardingState(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,sliderCompleted: null == sliderCompleted ? _self.sliderCompleted : sliderCompleted // ignore: cast_nullable_to_non_nullable
as bool,dragX: null == dragX ? _self.dragX : dragX // ignore: cast_nullable_to_non_nullable
as double,currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
