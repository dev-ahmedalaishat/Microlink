// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['user_id'] as String,
      name: json['username'] as String,
      avatarUrl: json['avatar_url'] as String?,
      unitDetails: json['unit_details'] as String?,
      isVerified: json['is_verified'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'username': instance.name,
      'avatar_url': instance.avatarUrl,
      'unit_details': instance.unitDetails,
      'is_verified': instance.isVerified,
    };
