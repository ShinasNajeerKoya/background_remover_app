// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ostrum_comments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OstrumCommentsState {

 bool get error; bool get isLoading; List<CommentModel> get comments;
/// Create a copy of OstrumCommentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OstrumCommentsStateCopyWith<OstrumCommentsState> get copyWith => _$OstrumCommentsStateCopyWithImpl<OstrumCommentsState>(this as OstrumCommentsState, _$identity);

  /// Serializes this OstrumCommentsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OstrumCommentsState&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.comments, comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,isLoading,const DeepCollectionEquality().hash(comments));

@override
String toString() {
  return 'OstrumCommentsState(error: $error, isLoading: $isLoading, comments: $comments)';
}


}

/// @nodoc
abstract mixin class $OstrumCommentsStateCopyWith<$Res>  {
  factory $OstrumCommentsStateCopyWith(OstrumCommentsState value, $Res Function(OstrumCommentsState) _then) = _$OstrumCommentsStateCopyWithImpl;
@useResult
$Res call({
 bool error, bool isLoading, List<CommentModel> comments
});




}
/// @nodoc
class _$OstrumCommentsStateCopyWithImpl<$Res>
    implements $OstrumCommentsStateCopyWith<$Res> {
  _$OstrumCommentsStateCopyWithImpl(this._self, this._then);

  final OstrumCommentsState _self;
  final $Res Function(OstrumCommentsState) _then;

/// Create a copy of OstrumCommentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? isLoading = null,Object? comments = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [OstrumCommentsState].
extension OstrumCommentsStatePatterns on OstrumCommentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OstrumCommentsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OstrumCommentsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OstrumCommentsState value)  $default,){
final _that = this;
switch (_that) {
case _OstrumCommentsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OstrumCommentsState value)?  $default,){
final _that = this;
switch (_that) {
case _OstrumCommentsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool error,  bool isLoading,  List<CommentModel> comments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OstrumCommentsState() when $default != null:
return $default(_that.error,_that.isLoading,_that.comments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool error,  bool isLoading,  List<CommentModel> comments)  $default,) {final _that = this;
switch (_that) {
case _OstrumCommentsState():
return $default(_that.error,_that.isLoading,_that.comments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool error,  bool isLoading,  List<CommentModel> comments)?  $default,) {final _that = this;
switch (_that) {
case _OstrumCommentsState() when $default != null:
return $default(_that.error,_that.isLoading,_that.comments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OstrumCommentsState implements OstrumCommentsState {
  const _OstrumCommentsState({this.error = false, this.isLoading = false, final  List<CommentModel> comments = const []}): _comments = comments;
  factory _OstrumCommentsState.fromJson(Map<String, dynamic> json) => _$OstrumCommentsStateFromJson(json);

@override@JsonKey() final  bool error;
@override@JsonKey() final  bool isLoading;
 final  List<CommentModel> _comments;
@override@JsonKey() List<CommentModel> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of OstrumCommentsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OstrumCommentsStateCopyWith<_OstrumCommentsState> get copyWith => __$OstrumCommentsStateCopyWithImpl<_OstrumCommentsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OstrumCommentsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OstrumCommentsState&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._comments, _comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,isLoading,const DeepCollectionEquality().hash(_comments));

@override
String toString() {
  return 'OstrumCommentsState(error: $error, isLoading: $isLoading, comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$OstrumCommentsStateCopyWith<$Res> implements $OstrumCommentsStateCopyWith<$Res> {
  factory _$OstrumCommentsStateCopyWith(_OstrumCommentsState value, $Res Function(_OstrumCommentsState) _then) = __$OstrumCommentsStateCopyWithImpl;
@override @useResult
$Res call({
 bool error, bool isLoading, List<CommentModel> comments
});




}
/// @nodoc
class __$OstrumCommentsStateCopyWithImpl<$Res>
    implements _$OstrumCommentsStateCopyWith<$Res> {
  __$OstrumCommentsStateCopyWithImpl(this._self, this._then);

  final _OstrumCommentsState _self;
  final $Res Function(_OstrumCommentsState) _then;

/// Create a copy of OstrumCommentsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? isLoading = null,Object? comments = null,}) {
  return _then(_OstrumCommentsState(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentModel>,
  ));
}


}

// dart format on
