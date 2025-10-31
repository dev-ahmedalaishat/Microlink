import '../../domain/entities/post.dart';
import '../../domain/entities/toggle_like_result.dart';
import '../../domain/repositories/social_repository.dart';
import '../datasources/social_remote_datasource.dart';
import '../models/post_model.dart';

class SocialRepositoryImpl implements SocialRepository {
  final SocialRemoteDataSource _remoteDataSource;

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
  Future<List<Post>> getMyPosts({int page = 1, int limit = 10}) async {
    try {
      final postModels = await _remoteDataSource.getMyPosts(
        userId: 'b780223a-a88c-45da-bea9-70e44d9f2837',
        page: page,
        limit: limit,
      );
      return postModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to load my posts: $e');
    }
  }

  @override
  Future<Post> createPost({
    required String content,
    required String userId,
    List<String> mediaUrls = const [],
  }) async {
    try {
      final postModel = await _remoteDataSource.createPost(
        content: content,
        userId: userId,
        mediaUrls: mediaUrls,
      );
      return postModel.toEntity();
    } catch (e) {
      throw Exception('Failed to create post: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getComments(String postId) async {
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
