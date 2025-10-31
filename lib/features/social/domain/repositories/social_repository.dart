import '../entities/post.dart';
import '../entities/toggle_like_result.dart';

abstract class SocialRepository {
  // Posts
  Future<List<Post>> getLatestPosts({
    int page = 1,
    int limit = 10,
    bool forceRefresh = false,
  });
  Future<List<Post>> getMyPosts({int page = 1, int limit = 10});
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
  Future<ToggleLikeResult> toggleLike({required String postId});

  // User management
  Future<String?> extractUserId();
  Future<bool> healthCheck();
}
