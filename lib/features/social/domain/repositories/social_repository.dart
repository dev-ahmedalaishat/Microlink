import '../entities/create_post_params.dart';
import '../entities/post.dart';
import '../entities/toggle_like_result.dart';
import '../entities/comment.dart';

final loggedUserId = 'b780223a-a88c-45da-bea9-70e44d9f2837';

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
  Future<Comment> addComment({required String postId, required String content});

  // Interactions
  Future<ToggleLikeResult> toggleLike({required String postId});

  // User management
  Future<String?> extractUserId();
  Future<bool> healthCheck();
}
