import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/comment.dart';
import '../../domain/entities/user.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    @JsonKey(name: 'comment_id') required String id,
    @JsonKey(name: 'post_id') required String postId,
    @JsonKey(name: 'user_id') required String userId,
    required String content,
    @JsonKey(name: 'created_at') required String createdAt,
    required CommentUserModel user,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}

@freezed
class CommentUserModel with _$CommentUserModel {
  const factory CommentUserModel({
    @JsonKey(name: 'user_id') required String id,
    required String username,
    @JsonKey(name: 'unit_details') String? unitDetails,
  }) = _CommentUserModel;

  factory CommentUserModel.fromJson(Map<String, dynamic> json) =>
      _$CommentUserModelFromJson(json);
}

@freezed
class CommentsResponse with _$CommentsResponse {
  const factory CommentsResponse({required List<CommentModel> comments}) =
      _CommentsResponse;

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);
}

extension CommentModelX on CommentModel {
  Comment toDomain(String loggedUserId) {
    return Comment(
      id: id,
      content: content,
      author: User(
        id: user.id,
        name: loggedUserId == user.id ? 'You' : user.username,
        unitDetails: user.unitDetails,
      ),
      createdAt: DateTime.parse(createdAt),
      postId: postId,
    );
  }
}
