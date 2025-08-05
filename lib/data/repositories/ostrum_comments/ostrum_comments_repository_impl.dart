import 'package:background_remover_app/domain/repositories/ostrum_comments/ostrum_comments_repository.dart';

import '../../../domain/models/comment/comment_model.dart';
import '../../services/comment_service/comment_service.dart';


class OstrumCommentsRepositoryImpl implements OstrumCommentsRepository {
  final OstrumCommentService _service;

  OstrumCommentsRepositoryImpl(this._service);

  @override
  Future<List<CommentModel>> fetchComments() async {
    final rawList = await _service.fetchCommentsRaw();
    return rawList.map(CommentModel.fromJson).toList();
  }
}
