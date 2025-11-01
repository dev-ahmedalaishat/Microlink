import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/create_post_params.dart';
import '../../../domain/repositories/social_repository.dart';
import 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final SocialRepository _repository;

  PostsCubit(this._repository) : super(const PostsState.initial());

  Future<void> loadLatestPosts({
    int page = 1,
    int limit = 10,
    bool forceRefresh = true,
  }) async {
    try {
      emit(const PostsState.loading());
      final posts = await _repository.getLatestPosts(
        page: page,
        limit: limit,
        forceRefresh: forceRefresh,
      );
      emit(PostsState.success(posts));
    } catch (e) {
      emit(PostsState.error(e.toString()));
    }
  }

  Future<void> refreshPosts() async {
    await loadLatestPosts();
  }

  Future<void> toggleLike(String postId) async {
    try {
      // Step 1: Optimistically update the UI
      state.maybeWhen(
        success: (posts) {
          final updatedPosts = posts.map((post) {
            if (post.id == postId) {
              final newIsLiked = !post.isLiked;
              final newLikesCount = newIsLiked
                  ? post.likesCount + 1
                  : post.likesCount - 1;
              return post.copyWith(
                isLiked: newIsLiked,
                likesCount: newLikesCount,
              );
            }
            return post;
          }).toList();
          emit(PostsState.success(updatedPosts));
        },
        orElse: () {},
      );

      // Step 2: Call the repository to toggle like
      final result = await _repository.toggleLike(postId: postId);

      // Step 3: Update state with actual result from server
      state.maybeWhen(
        success: (posts) {
          final updatedPosts = posts.map((post) {
            if (post.id == postId) {
              return post.copyWith(
                isLiked: result.isLiked,
                likesCount: result.likesCount,
              );
            }
            return post;
          }).toList();
          emit(PostsState.success(updatedPosts));
        },
        orElse: () {},
      );
    } catch (e) {
      // If error occurs, revert the optimistic update
      state.maybeWhen(
        success: (posts) {
          final revertedPosts = posts.map((post) {
            if (post.id == postId) {
              final revertIsLiked = !post.isLiked;
              final revertLikesCount = revertIsLiked
                  ? post.likesCount + 1
                  : post.likesCount - 1;
              return post.copyWith(
                isLiked: revertIsLiked,
                likesCount: revertLikesCount,
              );
            }
            return post;
          }).toList();
          emit(PostsState.success(revertedPosts));
        },
        orElse: () {},
      );
    }
  }
}

class MyPostsCubit extends Cubit<MyPostsState> {
  final SocialRepository _repository;

  MyPostsCubit(this._repository) : super(const MyPostsState.initial());

  Future<void> loadMyPosts({
    int page = 1,
    int limit = 10,
    bool forceRefresh = true,
  }) async {
    try {
      emit(const MyPostsState.loading());
      final posts = await _repository.getMyPosts(
        page: page,
        limit: limit,
        forceRefresh: forceRefresh,
      );
      emit(MyPostsState.success(posts));
    } catch (e) {
      emit(MyPostsState.error(e.toString()));
    }
  }

  Future<void> refreshMyPosts() async {
    await loadMyPosts(forceRefresh: false);
  }

  void reset() {
    emit(const MyPostsState.initial());
  }
}

class PostCreationCubit extends Cubit<PostCreationState> {
  final SocialRepository _repository;

  PostCreationCubit(this._repository)
    : super(const PostCreationState.initial());

  Future<void> createPost(CreatePostParams params) async {
    try {
      emit(const PostCreationState.loading());
      final post = await _repository.createPost(params);
      emit(PostCreationState.success(post));
    } catch (e) {
      emit(PostCreationState.error(e.toString()));
    }
  }

  void reset() {
    emit(const PostCreationState.initial());
  }
}
