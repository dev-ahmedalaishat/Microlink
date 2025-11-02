import '../../domain/entities/comment.dart';
import '../../domain/repositories/comments_repository.dart';
import '../datasources/comments_remote_datasource.dart';

class CommentsRepositoryImpl implements CommentsRepository {
  final CommentsRemoteDataSource _remoteDataSource;

  CommentsRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Comment>> getComments(String postId) async {
    try {
      return await _remoteDataSource.getComments(postId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Comment> addComment({
    required String postId,
    required String content,
  }) async {
    try {
      return await _remoteDataSource.addComment(
        postId: postId,
        content: content,
      );
    } catch (e) {
      rethrow;
    }
  }
}
