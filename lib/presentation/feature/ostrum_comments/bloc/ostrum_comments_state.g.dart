// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ostrum_comments_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OstrumCommentsState _$OstrumCommentsStateFromJson(Map<String, dynamic> json) =>
    _OstrumCommentsState(
      error: json['error'] as bool? ?? false,
      isLoading: json['isLoading'] as bool? ?? false,
      comments:
          (json['comments'] as List<dynamic>?)
              ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OstrumCommentsStateToJson(
  _OstrumCommentsState instance,
) => <String, dynamic>{
  'error': instance.error,
  'isLoading': instance.isLoading,
  'comments': instance.comments,
};
