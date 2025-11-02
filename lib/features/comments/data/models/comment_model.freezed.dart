// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return _CommentModel.fromJson(json);
}

/// @nodoc
mixin _$CommentModel {
  @JsonKey(name: 'comment_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_id')
  String get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  CommentUserModel get user => throw _privateConstructorUsedError;

  /// Serializes this CommentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
    CommentModel value,
    $Res Function(CommentModel) then,
  ) = _$CommentModelCopyWithImpl<$Res, CommentModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'comment_id') String id,
    @JsonKey(name: 'post_id') String postId,
    @JsonKey(name: 'user_id') String userId,
    String content,
    @JsonKey(name: 'created_at') String createdAt,
    CommentUserModel user,
  });

  $CommentUserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res, $Val extends CommentModel>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? userId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? user = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            postId: null == postId
                ? _value.postId
                : postId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as CommentUserModel,
          )
          as $Val,
    );
  }

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentUserModelCopyWith<$Res> get user {
    return $CommentUserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentModelImplCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$$CommentModelImplCopyWith(
    _$CommentModelImpl value,
    $Res Function(_$CommentModelImpl) then,
  ) = __$$CommentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'comment_id') String id,
    @JsonKey(name: 'post_id') String postId,
    @JsonKey(name: 'user_id') String userId,
    String content,
    @JsonKey(name: 'created_at') String createdAt,
    CommentUserModel user,
  });

  @override
  $CommentUserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$CommentModelImplCopyWithImpl<$Res>
    extends _$CommentModelCopyWithImpl<$Res, _$CommentModelImpl>
    implements _$$CommentModelImplCopyWith<$Res> {
  __$$CommentModelImplCopyWithImpl(
    _$CommentModelImpl _value,
    $Res Function(_$CommentModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? userId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? user = null,
  }) {
    return _then(
      _$CommentModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        postId: null == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as CommentUserModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentModelImpl implements _CommentModel {
  const _$CommentModelImpl({
    @JsonKey(name: 'comment_id') required this.id,
    @JsonKey(name: 'post_id') required this.postId,
    @JsonKey(name: 'user_id') required this.userId,
    required this.content,
    @JsonKey(name: 'created_at') required this.createdAt,
    required this.user,
  });

  factory _$CommentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentModelImplFromJson(json);

  @override
  @JsonKey(name: 'comment_id')
  final String id;
  @override
  @JsonKey(name: 'post_id')
  final String postId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String content;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final CommentUserModel user;

  @override
  String toString() {
    return 'CommentModel(id: $id, postId: $postId, userId: $userId, content: $content, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, postId, userId, content, createdAt, user);

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentModelImplCopyWith<_$CommentModelImpl> get copyWith =>
      __$$CommentModelImplCopyWithImpl<_$CommentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentModelImplToJson(this);
  }
}

abstract class _CommentModel implements CommentModel {
  const factory _CommentModel({
    @JsonKey(name: 'comment_id') required final String id,
    @JsonKey(name: 'post_id') required final String postId,
    @JsonKey(name: 'user_id') required final String userId,
    required final String content,
    @JsonKey(name: 'created_at') required final String createdAt,
    required final CommentUserModel user,
  }) = _$CommentModelImpl;

  factory _CommentModel.fromJson(Map<String, dynamic> json) =
      _$CommentModelImpl.fromJson;

  @override
  @JsonKey(name: 'comment_id')
  String get id;
  @override
  @JsonKey(name: 'post_id')
  String get postId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get content;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  CommentUserModel get user;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentModelImplCopyWith<_$CommentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentUserModel _$CommentUserModelFromJson(Map<String, dynamic> json) {
  return _CommentUserModel.fromJson(json);
}

/// @nodoc
mixin _$CommentUserModel {
  @JsonKey(name: 'user_id')
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_details')
  String? get unitDetails => throw _privateConstructorUsedError;

  /// Serializes this CommentUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentUserModelCopyWith<CommentUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentUserModelCopyWith<$Res> {
  factory $CommentUserModelCopyWith(
    CommentUserModel value,
    $Res Function(CommentUserModel) then,
  ) = _$CommentUserModelCopyWithImpl<$Res, CommentUserModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'user_id') String id,
    String username,
    @JsonKey(name: 'unit_details') String? unitDetails,
  });
}

/// @nodoc
class _$CommentUserModelCopyWithImpl<$Res, $Val extends CommentUserModel>
    implements $CommentUserModelCopyWith<$Res> {
  _$CommentUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? unitDetails = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            unitDetails: freezed == unitDetails
                ? _value.unitDetails
                : unitDetails // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CommentUserModelImplCopyWith<$Res>
    implements $CommentUserModelCopyWith<$Res> {
  factory _$$CommentUserModelImplCopyWith(
    _$CommentUserModelImpl value,
    $Res Function(_$CommentUserModelImpl) then,
  ) = __$$CommentUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'user_id') String id,
    String username,
    @JsonKey(name: 'unit_details') String? unitDetails,
  });
}

/// @nodoc
class __$$CommentUserModelImplCopyWithImpl<$Res>
    extends _$CommentUserModelCopyWithImpl<$Res, _$CommentUserModelImpl>
    implements _$$CommentUserModelImplCopyWith<$Res> {
  __$$CommentUserModelImplCopyWithImpl(
    _$CommentUserModelImpl _value,
    $Res Function(_$CommentUserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? unitDetails = freezed,
  }) {
    return _then(
      _$CommentUserModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        unitDetails: freezed == unitDetails
            ? _value.unitDetails
            : unitDetails // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentUserModelImpl implements _CommentUserModel {
  const _$CommentUserModelImpl({
    @JsonKey(name: 'user_id') required this.id,
    required this.username,
    @JsonKey(name: 'unit_details') this.unitDetails,
  });

  factory _$CommentUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentUserModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String id;
  @override
  final String username;
  @override
  @JsonKey(name: 'unit_details')
  final String? unitDetails;

  @override
  String toString() {
    return 'CommentUserModel(id: $id, username: $username, unitDetails: $unitDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.unitDetails, unitDetails) ||
                other.unitDetails == unitDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, unitDetails);

  /// Create a copy of CommentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentUserModelImplCopyWith<_$CommentUserModelImpl> get copyWith =>
      __$$CommentUserModelImplCopyWithImpl<_$CommentUserModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentUserModelImplToJson(this);
  }
}

abstract class _CommentUserModel implements CommentUserModel {
  const factory _CommentUserModel({
    @JsonKey(name: 'user_id') required final String id,
    required final String username,
    @JsonKey(name: 'unit_details') final String? unitDetails,
  }) = _$CommentUserModelImpl;

  factory _CommentUserModel.fromJson(Map<String, dynamic> json) =
      _$CommentUserModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get id;
  @override
  String get username;
  @override
  @JsonKey(name: 'unit_details')
  String? get unitDetails;

  /// Create a copy of CommentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentUserModelImplCopyWith<_$CommentUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentsResponse _$CommentsResponseFromJson(Map<String, dynamic> json) {
  return _CommentsResponse.fromJson(json);
}

/// @nodoc
mixin _$CommentsResponse {
  List<CommentModel> get comments => throw _privateConstructorUsedError;

  /// Serializes this CommentsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentsResponseCopyWith<CommentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsResponseCopyWith<$Res> {
  factory $CommentsResponseCopyWith(
    CommentsResponse value,
    $Res Function(CommentsResponse) then,
  ) = _$CommentsResponseCopyWithImpl<$Res, CommentsResponse>;
  @useResult
  $Res call({List<CommentModel> comments});
}

/// @nodoc
class _$CommentsResponseCopyWithImpl<$Res, $Val extends CommentsResponse>
    implements $CommentsResponseCopyWith<$Res> {
  _$CommentsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? comments = null}) {
    return _then(
      _value.copyWith(
            comments: null == comments
                ? _value.comments
                : comments // ignore: cast_nullable_to_non_nullable
                      as List<CommentModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CommentsResponseImplCopyWith<$Res>
    implements $CommentsResponseCopyWith<$Res> {
  factory _$$CommentsResponseImplCopyWith(
    _$CommentsResponseImpl value,
    $Res Function(_$CommentsResponseImpl) then,
  ) = __$$CommentsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CommentModel> comments});
}

/// @nodoc
class __$$CommentsResponseImplCopyWithImpl<$Res>
    extends _$CommentsResponseCopyWithImpl<$Res, _$CommentsResponseImpl>
    implements _$$CommentsResponseImplCopyWith<$Res> {
  __$$CommentsResponseImplCopyWithImpl(
    _$CommentsResponseImpl _value,
    $Res Function(_$CommentsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? comments = null}) {
    return _then(
      _$CommentsResponseImpl(
        comments: null == comments
            ? _value._comments
            : comments // ignore: cast_nullable_to_non_nullable
                  as List<CommentModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentsResponseImpl implements _CommentsResponse {
  const _$CommentsResponseImpl({required final List<CommentModel> comments})
    : _comments = comments;

  factory _$CommentsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsResponseImplFromJson(json);

  final List<CommentModel> _comments;
  @override
  List<CommentModel> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'CommentsResponse(comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsResponseImpl &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_comments));

  /// Create a copy of CommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsResponseImplCopyWith<_$CommentsResponseImpl> get copyWith =>
      __$$CommentsResponseImplCopyWithImpl<_$CommentsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsResponseImplToJson(this);
  }
}

abstract class _CommentsResponse implements CommentsResponse {
  const factory _CommentsResponse({
    required final List<CommentModel> comments,
  }) = _$CommentsResponseImpl;

  factory _CommentsResponse.fromJson(Map<String, dynamic> json) =
      _$CommentsResponseImpl.fromJson;

  @override
  List<CommentModel> get comments;

  /// Create a copy of CommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentsResponseImplCopyWith<_$CommentsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
