import '../entities/post.dart';
import '../entities/user.dart';

abstract class SocialRepository {
  // Posts
  Future<List<Post>> getLatestPosts({int page = 1, int limit = 10});
  Future<List<Post>> getMyPosts({required String userId, int page = 1, int limit = 10});
  Future<Post> createPost({
    required String content,
    required String userId,
    List<String> mediaUrls = const [],
  });

  // Comments
  Future<List<Map<String, dynamic>>> getComments(String postId);
  Future<Map<String, dynamic>> addComment({
    required String postId,
    required String content,
    required String userId,
  });

  // Interactions
  Future<Map<String, dynamic>> toggleLike({
    required String postId,
    required String userId,
  });

  // User management
  Future<String?> extractUserId();
  Future<bool> healthCheck();
}
