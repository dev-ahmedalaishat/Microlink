import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'post.freezed.dart';

enum PostStatus { pending, approved, rejected }

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String content,
    required User author,
    required DateTime createdAt,
    @Default(PostStatus.pending) PostStatus status,
    @Default([]) List<String> mediaUrls,
    @Default(0) int likesCount,
    @Default(0) int commentsCount,
    @Default(false) bool isLiked,
  }) = _Post;
}
