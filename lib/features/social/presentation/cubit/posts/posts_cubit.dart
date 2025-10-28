import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/social_repository.dart';
import 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final SocialRepository _repository;

  PostsCubit(this._repository) : super(const PostsState.initial());

  Future<void> loadLatestPosts({int page = 1, int limit = 10}) async {
    try {
      emit(const PostsState.loading());
      final posts = await _repository.getLatestPosts(page: page, limit: limit);
      emit(PostsState.success(posts));
    } catch (e) {
      emit(PostsState.error(e.toString()));
    }
  }

  Future<void> refreshPosts() async {
    await loadLatestPosts();
  }

  Future<void> toggleLike(String postId, String userId) async {
    try {
      await _repository.toggleLike(postId: postId, userId: userId);
      // Refresh posts to update like count
      await refreshPosts();
    } catch (e) {
      emit(PostsState.error('Failed to toggle like: ${e.toString()}'));
    }
  }
}

class MyPostsCubit extends Cubit<MyPostsState> {
  final SocialRepository _repository;

  MyPostsCubit(this._repository) : super(const MyPostsState.initial());

  Future<void> loadMyPosts(String userId, {int page = 1, int limit = 10}) async {
    try {
      emit(const MyPostsState.loading());
      final posts = await _repository.getMyPosts(
        userId: userId,
        page: page,
        limit: limit,
      );
      emit(MyPostsState.success(posts));
    } catch (e) {
      emit(MyPostsState.error(e.toString()));
    }
  }

  Future<void> refreshMyPosts(String userId) async {
    await loadMyPosts(userId);
  }
}

class PostCreationCubit extends Cubit<PostCreationState> {
  final SocialRepository _repository;

  PostCreationCubit(this._repository) : super(const PostCreationState.initial());

  Future<void> createPost({
    required String content,
    required String userId,
    List<String> mediaUrls = const [],
  }) async {
    try {
      emit(const PostCreationState.loading());
      final post = await _repository.createPost(
        content: content,
        userId: userId,
        mediaUrls: mediaUrls,
      );
      emit(PostCreationState.success(post));
    } catch (e) {
      emit(PostCreationState.error(e.toString()));
    }
  }

  void reset() {
    emit(const PostCreationState.initial());
  }
}
