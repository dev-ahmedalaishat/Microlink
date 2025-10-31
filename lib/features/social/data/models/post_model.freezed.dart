// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
mixin _$PostModel {
  @JsonKey(name: 'post_id')
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserModel get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_urls')
  List<String> get mediaUrls => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_count')
  int get commentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_liked')
  bool get isLiked => throw _privateConstructorUsedError;

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res, PostModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'post_id') String id,
    String content,
    @JsonKey(name: 'user') UserModel author,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'status') String status,
    @JsonKey(name: 'media_urls') List<String> mediaUrls,
    @JsonKey(name: 'like_count') int likesCount,
    @JsonKey(name: 'comment_count') int commentsCount,
    @JsonKey(name: 'is_liked') bool isLiked,
  });

  $UserModelCopyWith<$Res> get author;
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res, $Val extends PostModel>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? author = null,
    Object? createdAt = null,
    Object? status = null,
    Object? mediaUrls = null,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? isLiked = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            author: null == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                      as UserModel,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            mediaUrls: null == mediaUrls
                ? _value.mediaUrls
                : mediaUrls // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            likesCount: null == likesCount
                ? _value.likesCount
                : likesCount // ignore: cast_nullable_to_non_nullable
                      as int,
            commentsCount: null == commentsCount
                ? _value.commentsCount
                : commentsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isLiked: null == isLiked
                ? _value.isLiked
                : isLiked // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get author {
    return $UserModelCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostModelImplCopyWith<$Res>
    implements $PostModelCopyWith<$Res> {
  factory _$$PostModelImplCopyWith(
    _$PostModelImpl value,
    $Res Function(_$PostModelImpl) then,
  ) = __$$PostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'post_id') String id,
    String content,
    @JsonKey(name: 'user') UserModel author,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'status') String status,
    @JsonKey(name: 'media_urls') List<String> mediaUrls,
    @JsonKey(name: 'like_count') int likesCount,
    @JsonKey(name: 'comment_count') int commentsCount,
    @JsonKey(name: 'is_liked') bool isLiked,
  });

  @override
  $UserModelCopyWith<$Res> get author;
}

/// @nodoc
class __$$PostModelImplCopyWithImpl<$Res>
    extends _$PostModelCopyWithImpl<$Res, _$PostModelImpl>
    implements _$$PostModelImplCopyWith<$Res> {
  __$$PostModelImplCopyWithImpl(
    _$PostModelImpl _value,
    $Res Function(_$PostModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? author = null,
    Object? createdAt = null,
    Object? status = null,
    Object? mediaUrls = null,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? isLiked = null,
  }) {
    return _then(
      _$PostModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        author: null == author
            ? _value.author
            : author // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        mediaUrls: null == mediaUrls
            ? _value._mediaUrls
            : mediaUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        likesCount: null == likesCount
            ? _value.likesCount
            : likesCount // ignore: cast_nullable_to_non_nullable
                  as int,
        commentsCount: null == commentsCount
            ? _value.commentsCount
            : commentsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isLiked: null == isLiked
            ? _value.isLiked
            : isLiked // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostModelImpl implements _PostModel {
  const _$PostModelImpl({
    @JsonKey(name: 'post_id') required this.id,
    required this.content,
    @JsonKey(name: 'user') required this.author,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'status') this.status = 'PENDING',
    @JsonKey(name: 'media_urls') final List<String> mediaUrls = const [],
    @JsonKey(name: 'like_count') this.likesCount = 0,
    @JsonKey(name: 'comment_count') this.commentsCount = 0,
    @JsonKey(name: 'is_liked') this.isLiked = false,
  }) : _mediaUrls = mediaUrls;

  factory _$PostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostModelImplFromJson(json);

  @override
  @JsonKey(name: 'post_id')
  final String id;
  @override
  final String content;
  @override
  @JsonKey(name: 'user')
  final UserModel author;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'status')
  final String status;
  final List<String> _mediaUrls;
  @override
  @JsonKey(name: 'media_urls')
  List<String> get mediaUrls {
    if (_mediaUrls is EqualUnmodifiableListView) return _mediaUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaUrls);
  }

  @override
  @JsonKey(name: 'like_count')
  final int likesCount;
  @override
  @JsonKey(name: 'comment_count')
  final int commentsCount;
  @override
  @JsonKey(name: 'is_liked')
  final bool isLiked;

  @override
  String toString() {
    return 'PostModel(id: $id, content: $content, author: $author, createdAt: $createdAt, status: $status, mediaUrls: $mediaUrls, likesCount: $likesCount, commentsCount: $commentsCount, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._mediaUrls,
              _mediaUrls,
            ) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    content,
    author,
    createdAt,
    status,
    const DeepCollectionEquality().hash(_mediaUrls),
    likesCount,
    commentsCount,
    isLiked,
  );

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostModelImplCopyWith<_$PostModelImpl> get copyWith =>
      __$$PostModelImplCopyWithImpl<_$PostModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostModelImplToJson(this);
  }
}

abstract class _PostModel implements PostModel {
  const factory _PostModel({
    @JsonKey(name: 'post_id') required final String id,
    required final String content,
    @JsonKey(name: 'user') required final UserModel author,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'status') final String status,
    @JsonKey(name: 'media_urls') final List<String> mediaUrls,
    @JsonKey(name: 'like_count') final int likesCount,
    @JsonKey(name: 'comment_count') final int commentsCount,
    @JsonKey(name: 'is_liked') final bool isLiked,
  }) = _$PostModelImpl;

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$PostModelImpl.fromJson;

  @override
  @JsonKey(name: 'post_id')
  String get id;
  @override
  String get content;
  @override
  @JsonKey(name: 'user')
  UserModel get author;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'media_urls')
  List<String> get mediaUrls;
  @override
  @JsonKey(name: 'like_count')
  int get likesCount;
  @override
  @JsonKey(name: 'comment_count')
  int get commentsCount;
  @override
  @JsonKey(name: 'is_liked')
  bool get isLiked;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostModelImplCopyWith<_$PostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
