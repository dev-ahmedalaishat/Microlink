import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String content,
    required User author,
    required DateTime createdAt,
    required String postId,
  }) = _Comment;
}
