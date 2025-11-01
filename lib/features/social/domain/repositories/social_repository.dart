import '../entities/create_post_params.dart';
import '../entities/post.dart';
import '../entities/toggle_like_result.dart';
import '../entities/comment.dart';

abstract class SocialRepository {
  // Posts
  Future<List<Post>> getLatestPosts({
    int page = 1,
    int limit = 10,
    bool forceRefresh = false,
  });
  Future<List<Post>> getMyPosts({
    int page = 1,
    int limit = 10,
    bool forceRefresh = false,
  });
  Future<Post> createPost(CreatePostParams params);

  // Comments
  Future<List<Comment>> getComments(String postId);
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
