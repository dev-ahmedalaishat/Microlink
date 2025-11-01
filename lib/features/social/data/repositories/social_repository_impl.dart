import '../../domain/entities/create_post_params.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/comment.dart';
import '../../domain/entities/toggle_like_result.dart';
import '../../domain/repositories/social_repository.dart';
import '../datasources/social_remote_datasource.dart';
import '../models/create_post_request_model.dart';
import '../models/post_model.dart';

class SocialRepositoryImpl implements SocialRepository {
  final SocialRemoteDataSource _remoteDataSource;

  // Cache for my posts
  List<Post>? _cachedMyPosts;

  SocialRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Post>> getLatestPosts({
    int page = 1,
    int limit = 10,
    bool forceRefresh = false,
  }) async {
    try {
      final postModels = await _remoteDataSource.getLatestPosts(
        page: page,
        limit: limit,
      );
      return postModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to load latest posts: $e');
    }
  }

  @override
  Future<List<Post>> getMyPosts({
    int page = 1,
    int limit = 10,
    bool forceRefresh = false,
  }) async {
    try {
      // Return cached data if available and not forcing refresh
      if (!forceRefresh && _cachedMyPosts != null) {
        return _cachedMyPosts!;
      }

      // Fetch from remote
      final postModels = await _remoteDataSource.getMyPosts(
        userId: 'b780223a-a88c-45da-bea9-70e44d9f2837',
        page: page,
        limit: limit,
      );
      final posts = postModels.map((model) => model.toEntity()).toList();

      // Cache the posts
      _cachedMyPosts = posts;

      return posts;
    } catch (e) {
      throw Exception('Failed to load my posts: $e');
    }
  }

  @override
  Future<Post> createPost(CreatePostParams params) async {
    try {
      final userId = 'b780223a-a88c-45da-bea9-70e44d9f2837';

      // Create request model
      final request = CreatePostRequestModel.fromEntity(params, userId);

      // Call API with request model
      final postModel = await _remoteDataSource.createPost(request);
      final newPost = postModel.toEntity();

      // Add to cached posts (prepend to the beginning)
      if (_cachedMyPosts != null) {
        _cachedMyPosts = [newPost, ..._cachedMyPosts!];
      }

      return newPost;
    } catch (e) {
      throw Exception('Failed to create post: $e');
    }
  }

  @override
  Future<List<Comment>> getComments(String postId) async {
    try {
      return await _remoteDataSource.getComments(postId);
    } catch (e) {
      throw Exception('Failed to load comments: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> addComment({
    required String postId,
    required String content,
    required String userId,
  }) async {
    try {
      return await _remoteDataSource.addComment(
        postId: postId,
        content: content,
        userId: userId,
      );
    } catch (e) {
      throw Exception('Failed to add comment: $e');
    }
  }

  @override
  Future<ToggleLikeResult> toggleLike({required String postId}) async {
    try {
      final response = await _remoteDataSource.toggleLike(
        postId: postId,
        userId: 'b780223a-a88c-45da-bea9-70e44d9f2837',
      );
      return ToggleLikeResult(
        isLiked: response['action'] as String == 'liked',
        likesCount: response['like_count'] as int,
      );
    } catch (e) {
      throw Exception('Failed to toggle like: $e');
    }
  }

  @override
  Future<String?> extractUserId() async {
    try {
      return await _remoteDataSource.extractUserId();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> healthCheck() async {
    try {
      return await _remoteDataSource.healthCheck();
    } catch (e) {
      return false;
    }
  }
}
