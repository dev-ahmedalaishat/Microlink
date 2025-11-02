import '../../../../core/network/api_client.dart';
import '../../../social/domain/repositories/social_repository.dart';
import '../models/comment_model.dart';
import '../../domain/entities/comment.dart';

class CommentsRemoteDataSource {
  final ApiClient _apiClient;

  CommentsRemoteDataSource(this._apiClient);

  Future<List<Comment>> getComments(String postId) async {
    final response = await _apiClient.get('/posts/$postId/comments');
    await Future.delayed(const Duration(milliseconds: 500));

    final responseData = response.data;
    final List<dynamic> data;

    if (responseData is List) {
      data = responseData;
    } else if (responseData is Map<String, dynamic>) {
      data = responseData['comments'] ?? responseData['data'] ?? [];
    } else {
      data = [];
    }

    return data
        .map((json) => CommentModel.fromJson(json as Map<String, dynamic>))
        .map((model) => model.toDomain(loggedUserId))
        .toList();
  }

  Future<Comment> addComment({
    required String postId,
    required String content,
  }) async {
    final response = await _apiClient.post(
      '/posts/$postId/comments',
      data: {'content': content, 'user_id': loggedUserId},
    );
    await Future.delayed(const Duration(milliseconds: 500));
    final responseData = response.data;
    return CommentModel.fromJson(
      responseData as Map<String, dynamic>,
    ).toDomain(loggedUserId);
  }
}
