import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/social_repository.dart';
import 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final SocialRepository _repository;

  CommentsCubit(this._repository) : super(const CommentsState.initial());

  Future<void> loadComments(String postId) async {
    try {
      emit(const CommentsState.loading());
      final comments = await _repository.getComments(postId);
      emit(CommentsState.success(comments));
    } catch (e) {
      emit(CommentsState.error(e.toString()));
    }
  }

  Future<void> refreshComments(String postId) async {
    await loadComments(postId);
  }

  void reset() {
    emit(const CommentsState.initial());
  }
}

class AddCommentCubit extends Cubit<AddCommentState> {
  final SocialRepository _repository;

  AddCommentCubit(this._repository) : super(const AddCommentState.initial());

  Future<void> addComment({
    required String postId,
    required String content,
    required String userId,
  }) async {
    try {
      emit(const AddCommentState.loading());
      await _repository.addComment(
        postId: postId,
        content: content,
        userId: userId,
      );
      emit(const AddCommentState.success());
    } catch (e) {
      emit(AddCommentState.error(e.toString()));
    }
  }

  void reset() {
    emit(const AddCommentState.initial());
  }
}
