import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/post.dart';

part 'posts_state.freezed.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.initial() = _Initial;
  const factory PostsState.loading() = _Loading;
  const factory PostsState.success(List<Post> posts) = _Success;
  const factory PostsState.error(String message) = _Error;
}

@freezed
class MyPostsState with _$MyPostsState {
  const factory MyPostsState.initial() = _MyPostsInitial;
  const factory MyPostsState.loading() = _MyPostsLoading;
  const factory MyPostsState.success(List<Post> posts) = _MyPostsSuccess;
  const factory MyPostsState.error(String message) = _MyPostsError;
}

@freezed
class PostCreationState with _$PostCreationState {
  const factory PostCreationState.initial() = _PostCreationInitial;
  const factory PostCreationState.loading() = _PostCreationLoading;
  const factory PostCreationState.success(Post post) = _PostCreationSuccess;
  const factory PostCreationState.error(String message) = _PostCreationError;
}
