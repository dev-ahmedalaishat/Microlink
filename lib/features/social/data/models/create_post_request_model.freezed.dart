// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_post_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreatePostRequestModel _$CreatePostRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _CreatePostRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreatePostRequestModel {
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_urls')
  List<String> get mediaUrls => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this CreatePostRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePostRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePostRequestModelCopyWith<CreatePostRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostRequestModelCopyWith<$Res> {
  factory $CreatePostRequestModelCopyWith(
    CreatePostRequestModel value,
    $Res Function(CreatePostRequestModel) then,
  ) = _$CreatePostRequestModelCopyWithImpl<$Res, CreatePostRequestModel>;
  @useResult
  $Res call({
    String content,
    @JsonKey(name: 'media_urls') List<String> mediaUrls,
    @JsonKey(name: 'user_id') String userId,
  });
}

/// @nodoc
class _$CreatePostRequestModelCopyWithImpl<
  $Res,
  $Val extends CreatePostRequestModel
>
    implements $CreatePostRequestModelCopyWith<$Res> {
  _$CreatePostRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePostRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? mediaUrls = null,
    Object? userId = null,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            mediaUrls: null == mediaUrls
                ? _value.mediaUrls
                : mediaUrls // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreatePostRequestModelImplCopyWith<$Res>
    implements $CreatePostRequestModelCopyWith<$Res> {
  factory _$$CreatePostRequestModelImplCopyWith(
    _$CreatePostRequestModelImpl value,
    $Res Function(_$CreatePostRequestModelImpl) then,
  ) = __$$CreatePostRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String content,
    @JsonKey(name: 'media_urls') List<String> mediaUrls,
    @JsonKey(name: 'user_id') String userId,
  });
}

/// @nodoc
class __$$CreatePostRequestModelImplCopyWithImpl<$Res>
    extends
        _$CreatePostRequestModelCopyWithImpl<$Res, _$CreatePostRequestModelImpl>
    implements _$$CreatePostRequestModelImplCopyWith<$Res> {
  __$$CreatePostRequestModelImplCopyWithImpl(
    _$CreatePostRequestModelImpl _value,
    $Res Function(_$CreatePostRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreatePostRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? mediaUrls = null,
    Object? userId = null,
  }) {
    return _then(
      _$CreatePostRequestModelImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        mediaUrls: null == mediaUrls
            ? _value._mediaUrls
            : mediaUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePostRequestModelImpl implements _CreatePostRequestModel {
  const _$CreatePostRequestModelImpl({
    required this.content,
    @JsonKey(name: 'media_urls') final List<String> mediaUrls = const [],
    @JsonKey(name: 'user_id') required this.userId,
  }) : _mediaUrls = mediaUrls;

  factory _$CreatePostRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePostRequestModelImplFromJson(json);

  @override
  final String content;
  final List<String> _mediaUrls;
  @override
  @JsonKey(name: 'media_urls')
  List<String> get mediaUrls {
    if (_mediaUrls is EqualUnmodifiableListView) return _mediaUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaUrls);
  }

  @override
  @JsonKey(name: 'user_id')
  final String userId;

  @override
  String toString() {
    return 'CreatePostRequestModel(content: $content, mediaUrls: $mediaUrls, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostRequestModelImpl &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(
              other._mediaUrls,
              _mediaUrls,
            ) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    content,
    const DeepCollectionEquality().hash(_mediaUrls),
    userId,
  );

  /// Create a copy of CreatePostRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostRequestModelImplCopyWith<_$CreatePostRequestModelImpl>
  get copyWith =>
      __$$CreatePostRequestModelImplCopyWithImpl<_$CreatePostRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePostRequestModelImplToJson(this);
  }
}

abstract class _CreatePostRequestModel implements CreatePostRequestModel {
  const factory _CreatePostRequestModel({
    required final String content,
    @JsonKey(name: 'media_urls') final List<String> mediaUrls,
    @JsonKey(name: 'user_id') required final String userId,
  }) = _$CreatePostRequestModelImpl;

  factory _CreatePostRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreatePostRequestModelImpl.fromJson;

  @override
  String get content;
  @override
  @JsonKey(name: 'media_urls')
  List<String> get mediaUrls;
  @override
  @JsonKey(name: 'user_id')
  String get userId;

  /// Create a copy of CreatePostRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePostRequestModelImplCopyWith<_$CreatePostRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
