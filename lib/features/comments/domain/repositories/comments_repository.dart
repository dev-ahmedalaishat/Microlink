import '../entities/comment.dart';

abstract class CommentsRepository {
  Future<List<Comment>> getComments(String postId);
  Future<Comment> addComment({required String postId, required String content});
}
