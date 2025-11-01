import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/comment.dart';

part 'comments_state.freezed.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState.initial() = _Initial;
  const factory CommentsState.loading() = _Loading;
  const factory CommentsState.success(List<Comment> comments) = _Success;
  const factory CommentsState.error(String message) = _Error;
}
