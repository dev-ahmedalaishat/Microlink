// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      id: json['post_id'] as String,
      content: json['content'] as String,
      author: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
      status: json['status'] as String? ?? 'PENDING',
      mediaUrls:
          (json['media_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      likesCount: (json['like_count'] as num?)?.toInt() ?? 0,
      commentsCount: (json['comment_count'] as num?)?.toInt() ?? 0,
      isLiked: json['is_liked'] as bool? ?? false,
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'post_id': instance.id,
      'content': instance.content,
      'user': instance.author,
      'created_at': instance.createdAt,
      'status': instance.status,
      'media_urls': instance.mediaUrls,
      'like_count': instance.likesCount,
      'comment_count': instance.commentsCount,
      'is_liked': instance.isLiked,
    };
