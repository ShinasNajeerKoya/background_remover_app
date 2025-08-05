import '../../models/comment/comment_model.dart';

abstract class OstrumCommentsRepository {
/// Add your repository logic here
  Future<List<CommentModel>> fetchComments();
}
