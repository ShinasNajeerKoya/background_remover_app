import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
abstract class CommentModel with _$CommentModel {
  const factory CommentModel({
    @JsonKey(name: 'postId') int? postId,
    @JsonKey(name: 'id') int?  id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'body') String? body,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
