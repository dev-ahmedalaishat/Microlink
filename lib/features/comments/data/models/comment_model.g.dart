// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      id: json['comment_id'] as String,
      postId: json['post_id'] as String,
      userId: json['user_id'] as String,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      user: CommentUserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'comment_id': instance.id,
      'post_id': instance.postId,
      'user_id': instance.userId,
      'content': instance.content,
      'created_at': instance.createdAt,
      'user': instance.user,
    };

_$CommentUserModelImpl _$$CommentUserModelImplFromJson(
  Map<String, dynamic> json,
) => _$CommentUserModelImpl(
  id: json['user_id'] as String,
  username: json['username'] as String,
  unitDetails: json['unit_details'] as String?,
);

Map<String, dynamic> _$$CommentUserModelImplToJson(
  _$CommentUserModelImpl instance,
) => <String, dynamic>{
  'user_id': instance.id,
  'username': instance.username,
  'unit_details': instance.unitDetails,
};

_$CommentsResponseImpl _$$CommentsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CommentsResponseImpl(
  comments: (json['comments'] as List<dynamic>)
      .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CommentsResponseImplToJson(
  _$CommentsResponseImpl instance,
) => <String, dynamic>{'comments': instance.comments};
