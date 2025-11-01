import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/comment.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/repositories/social_repository.dart';
import 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final SocialRepository _repository;
  final Random _random = Random();

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

  Future<void> tryAddComment({
    required String postId,
    required String content,
  }) async {
    // Only proceed if the current state is success
    state.maybeWhen(
      success: (currentComments) async {
        final pendingComment = _createPendingComment(
          content: content,
          postId: postId,
        );

        // Add pending comment to the list
        final updatedCommentsWithPending = [...currentComments, pendingComment];
        emit(CommentsState.success(updatedCommentsWithPending));

        await Future.delayed(const Duration(milliseconds: 500));

        try {
          // Make the API call
          final actualComment = await _repository.addComment(
            postId: postId,
            content: content,
          );

          // Replace the pending comment with the actual one
          _replacePendingComment(pendingComment.id, actualComment);
          // ignore: empty_catches
        } catch (e) {}
      },
      orElse: () {
        // Ignore the add comment request if not in success state
      },
    );
  }

  Future<void> addComment({
    required List<Comment> currentComments,
    required String postId,
    required String content,
  }) async {
    final pendingComment = _createPendingComment(
      content: content,
      postId: postId,
    );

    // Add pending comment to the list
    final updatedCommentsWithPending = [...currentComments, pendingComment];
    emit(CommentsState.success(updatedCommentsWithPending));

    await Future.delayed(const Duration(milliseconds: 500));

    try {
      // Make the API call
      final actualComment = await _repository.addComment(
        postId: postId,
        content: content,
      );

      // Replace the pending comment with the actual one
      _replacePendingComment(pendingComment.id, actualComment);
      // ignore: empty_catches
    } catch (e) {}
  }

  void _replacePendingComment(String pendingId, Comment actualComment) {
    state.maybeWhen(
      success: (comments) {
        final updatedComments = comments.map((comment) {
          if (comment.id == pendingId) {
            return actualComment;
          }
          return comment;
        }).toList();
        emit(CommentsState.success(updatedComments));
      },
      orElse: () {},
    );
  }

  Comment _createPendingComment({
    required String content,
    required String postId,
  }) {
    // Generate a pending comment ID
    final pendingId = 'pending_${_random.nextInt(999999)}';
    return Comment(
      id: pendingId,
      content: content,
      author: const User(id: 'temp', name: 'You'),
      createdAt: DateTime.now(),
      postId: postId,
    );
  }
}
