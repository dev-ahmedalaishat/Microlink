import 'package:microlink/features/social/data/models/post_model.dart';
import 'package:microlink/features/social/data/models/create_post_request_model.dart';
import 'package:microlink/features/social/domain/entities/post.dart';
import 'package:microlink/features/social/domain/repositories/social_repository.dart';
import '../../../../core/network/api_client.dart';

class SocialRemoteDataSource {
  final ApiClient _apiClient;

  SocialRemoteDataSource(this._apiClient);

  // Get latest approved posts
  Future<List<PostModel>> getLatestPosts({int page = 1, int limit = 10}) async {
    final response = await _apiClient.get(
      '/posts/latest',
      queryParameters: {'page': page, 'limit': limit},
    );
    await Future.delayed(const Duration(milliseconds: 500));

    final responseData = response.data;
    final List<dynamic> data;

    if (responseData is List) {
      data = responseData;
    } else if (responseData is Map<String, dynamic>) {
      data = responseData['posts'] ?? responseData['data'] ?? [];
    } else {
      data = [];
    }

    return data
        .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // Get user's posts (both pending and approved)
  Future<List<PostModel>> getMyPosts({
    required String userId,
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _apiClient.get(
      '/posts/my',
      queryParameters: {'user_id': userId, 'page': page, 'limit': limit},
    );
    await Future.delayed(const Duration(milliseconds: 500));

    final responseData = response.data;
    final List<dynamic> data;

    if (responseData is List) {
      data = responseData;
    } else if (responseData is Map<String, dynamic>) {
      data = responseData['posts'] ?? responseData['data'] ?? [];
    } else {
      data = [];
    }

    return data
        .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // Create a new post
  Future<Post> createPost(CreatePostRequestModel request) async {
    final response = await _apiClient.post('/posts', data: request.toJson());
    await Future.delayed(const Duration(milliseconds: 500));
    final responseData = response.data;
    final Map<String, dynamic> postData;
    if (responseData is Map<String, dynamic>) {
      postData = responseData['post'] ?? responseData['data'] ?? responseData;
    } else {
      throw Exception('Invalid response format');
    }
    return PostModel.fromJson(postData).toDomain(loggedUserId);
  }

  // Toggle like on a post
  Future<Map<String, dynamic>> toggleLike({
    required String postId,
    required String userId,
  }) async {
    final response = await _apiClient.post(
      '/posts/$postId/like',
      data: {'user_id': userId},
    );

    return response.data;
  }

  // Health check
  Future<bool> healthCheck() async {
    try {
      final response = await _apiClient.get('/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // Extract user ID from posts (for initial setup)
  Future<String?> extractUserId() async {
    try {
      final posts = await getLatestPosts(limit: 1);
      if (posts.isNotEmpty) {
        return posts.first.author.id;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
