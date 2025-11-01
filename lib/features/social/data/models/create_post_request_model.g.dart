// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePostRequestModelImpl _$$CreatePostRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$CreatePostRequestModelImpl(
  content: json['content'] as String,
  mediaUrls:
      (json['media_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  userId: json['user_id'] as String,
);

Map<String, dynamic> _$$CreatePostRequestModelImplToJson(
  _$CreatePostRequestModelImpl instance,
) => <String, dynamic>{
  'content': instance.content,
  'media_urls': instance.mediaUrls,
  'user_id': instance.userId,
};
