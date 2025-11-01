import 'package:microlink/features/social/data/models/post_model.dart';
import 'package:microlink/features/social/data/models/create_post_request_model.dart';
import 'package:microlink/features/social/data/models/comment_model.dart';
import '../../domain/entities/comment.dart';

import '../../../../../../core/network/api_client.dart';

class SocialRemoteDataSource {
  final ApiClient _apiClient;

  SocialRemoteDataSource(this._apiClient);

  // Get latest approved posts
  Future<List<PostModel>> getLatestPosts({int page = 1, int limit = 10}) async {
    final response = await _apiClient.get(
      '/posts/latest',
      queryParameters: {'page': page, 'limit': limit},
    );

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
  Future<PostModel> createPost(CreatePostRequestModel request) async {
    // TODO: Uncomment when API is ready
    // final response = await _apiClient.post('/posts', data: request.toJson());
    // final responseData = response.data;
    // final Map<String, dynamic> postData;
    // if (responseData is Map<String, dynamic>) {
    //   postData = responseData['post'] ?? responseData['data'] ?? responseData;
    // } else {
    //   throw Exception('Invalid response format');
    // }
    // return PostModel.fromJson(postData);

    // MOCK: Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 800));

    // MOCK: Simulate API response with PENDING status
    final mockResponse = {
      'post_id': DateTime.now().millisecondsSinceEpoch.toString(),
      'content': request.content,
      'media_urls': request.mediaUrls,
      'status': 'PENDING',
      'like_count': 0,
      'comment_count': 0,
      'is_liked': false,
      'created_at': DateTime.now().toIso8601String(),
      'user': {
        'user_id': request.userId,
        'username': 'Mock User',
        'avatar_url':
            'https://ui-avatars.com/api/?name=Mock+User&background=008080&color=fff',
        'unit_details': 'Building A, Unit 101',
        'is_verified': false,
      },
    };

    return PostModel.fromJson(mockResponse);
  }

  // Get comments for a post
  Future<List<Comment>> getComments(String postId) async {
    final response = await _apiClient.get('/posts/$postId/comments');

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
        .map((model) => model.toDomain())
        .toList();
  }

  // Add a comment to a post
  Future<Map<String, dynamic>> addComment({
    required String postId,
    required String content,
    required String userId,
  }) async {
    final response = await _apiClient.post(
      '/posts/$postId/comments',
      data: {'content': content, 'user_id': userId},
    );

    return response.data;
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
