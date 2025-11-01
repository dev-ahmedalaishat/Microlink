import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:microlink/features/social/domain/entities/post.dart';
import 'user_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    @JsonKey(name: 'post_id') required String id,
    required String content,
    @JsonKey(name: 'user') required UserModel author,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'status') @Default('PENDING') String status,
    @JsonKey(name: 'media_urls') @Default([]) List<String> mediaUrls,
    @JsonKey(name: 'like_count') @Default(0) int likesCount,
    @JsonKey(name: 'comment_count') @Default(0) int commentsCount,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}

extension PostModelX on PostModel {
  Post toDomain(String loggedUserId) => Post(
    id: id,
    content: content,
    author: author.toDomain(loggedUserId),
    createdAt: DateTime.parse(createdAt),
    status: _parsePostStatus(status),
    mediaUrls: mediaUrls,
    likesCount: likesCount,
    commentsCount: commentsCount,
    isLiked: isLiked,
  );
}

extension PostX on Post {
  PostModel toModel() => PostModel(
    id: id,
    content: content,
    author: author.toModel(),
    createdAt: createdAt.toIso8601String(),
    status: status.name,
    mediaUrls: mediaUrls,
    likesCount: likesCount,
    commentsCount: commentsCount,
    isLiked: isLiked,
  );
}

PostStatus _parsePostStatus(String status) {
  switch (status.toLowerCase()) {
    case 'approved':
      return PostStatus.approved;
    case 'rejected':
      return PostStatus.rejected;
    case 'pending':
    default:
      return PostStatus.pending;
  }
}
