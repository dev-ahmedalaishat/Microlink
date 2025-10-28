// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PostsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Post> posts)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsStateCopyWith<$Res> {
  factory $PostsStateCopyWith(
    PostsState value,
    $Res Function(PostsState) then,
  ) = _$PostsStateCopyWithImpl<$Res, PostsState>;
}

/// @nodoc
class _$PostsStateCopyWithImpl<$Res, $Val extends PostsState>
    implements $PostsStateCopyWith<$Res> {
  _$PostsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PostsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Post> posts)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PostsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PostsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Post> posts)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PostsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Post> posts});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? posts = null}) {
    return _then(
      _$SuccessImpl(
        null == posts
            ? _value._posts
            : posts // ignore: cast_nullable_to_non_nullable
                  as List<Post>,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<Post> posts) : _posts = posts;

  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'PostsState.success(posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_posts));

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) success,
    required TResult Function(String message) error,
  }) {
    return success(posts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Post> posts)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements PostsState {
  const factory _Success(final List<Post> posts) = _$SuccessImpl;

  List<Post> get posts;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'PostsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Post> posts)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PostsState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MyPostsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Post> posts)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MyPostsInitial value) initial,
    required TResult Function(_MyPostsLoading value) loading,
    required TResult Function(_MyPostsSuccess value) success,
    required TResult Function(_MyPostsError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MyPostsInitial value)? initial,
    TResult? Function(_MyPostsLoading value)? loading,
    TResult? Function(_MyPostsSuccess value)? success,
    TResult? Function(_MyPostsError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MyPostsInitial value)? initial,
    TResult Function(_MyPostsLoading value)? loading,
    TResult Function(_MyPostsSuccess value)? success,
    TResult Function(_MyPostsError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPostsStateCopyWith<$Res> {
  factory $MyPostsStateCopyWith(
    MyPostsState value,
    $Res Function(MyPostsState) then,
  ) = _$MyPostsStateCopyWithImpl<$Res, MyPostsState>;
}

/// @nodoc
class _$MyPostsStateCopyWithImpl<$Res, $Val extends MyPostsState>
    implements $MyPostsStateCopyWith<$Res> {
  _$MyPostsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyPostsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MyPostsInitialImplCopyWith<$Res> {
  factory _$$MyPostsInitialImplCopyWith(
    _$MyPostsInitialImpl value,
    $Res Function(_$MyPostsInitialImpl) then,
  ) = __$$MyPostsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyPostsInitialImplCopyWithImpl<$Res>
    extends _$MyPostsStateCopyWithImpl<$Res, _$MyPostsInitialImpl>
    implements _$$MyPostsInitialImplCopyWith<$Res> {
  __$$MyPostsInitialImplCopyWithImpl(
    _$MyPostsInitialImpl _value,
    $Res Function(_$MyPostsInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyPostsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MyPostsInitialImpl implements _MyPostsInitial {
  const _$MyPostsInitialImpl();

  @override
  String toString() {
    return 'MyPostsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MyPostsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Post> posts)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MyPostsInitial value) initial,
    required TResult Function(_MyPostsLoading value) loading,
    required TResult Function(_MyPostsSuccess value) success,
    required TResult Function(_MyPostsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MyPostsInitial value)? initial,
    TResult? Function(_MyPostsLoading value)? loading,
    TResult? Function(_MyPostsSuccess value)? success,
    TResult? Function(_MyPostsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MyPostsInitial value)? initial,
    TResult Function(_MyPostsLoading value)? loading,
    TResult Function(_MyPostsSuccess value)? success,
    TResult Function(_MyPostsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _MyPostsInitial implements MyPostsState {
  const factory _MyPostsInitial() = _$MyPostsInitialImpl;
}

/// @nodoc
abstract class _$$MyPostsLoadingImplCopyWith<$Res> {
  factory _$$MyPostsLoadingImplCopyWith(
    _$MyPostsLoadingImpl value,
    $Res Function(_$MyPostsLoadingImpl) then,
  ) = __$$MyPostsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyPostsLoadingImplCopyWithImpl<$Res>
    extends _$MyPostsStateCopyWithImpl<$Res, _$MyPostsLoadingImpl>
    implements _$$MyPostsLoadingImplCopyWith<$Res> {
  __$$MyPostsLoadingImplCopyWithImpl(
    _$MyPostsLoadingImpl _value,
    $Res Function(_$MyPostsLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyPostsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MyPostsLoadingImpl implements _MyPostsLoading {
  const _$MyPostsLoadingImpl();

  @override
  String toString() {
    return 'MyPostsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MyPostsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Post> posts)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MyPostsInitial value) initial,
    required TResult Function(_MyPostsLoading value) loading,
    required TResult Function(_MyPostsSuccess value) success,
    required TResult Function(_MyPostsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MyPostsInitial value)? initial,
    TResult? Function(_MyPostsLoading value)? loading,
    TResult? Function(_MyPostsSuccess value)? success,
    TResult? Function(_MyPostsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MyPostsInitial value)? initial,
    TResult Function(_MyPostsLoading value)? loading,
    TResult Function(_MyPostsSuccess value)? success,
    TResult Function(_MyPostsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _MyPostsLoading implements MyPostsState {
  const factory _MyPostsLoading() = _$MyPostsLoadingImpl;
}

/// @nodoc
abstract class _$$MyPostsSuccessImplCopyWith<$Res> {
  factory _$$MyPostsSuccessImplCopyWith(
    _$MyPostsSuccessImpl value,
    $Res Function(_$MyPostsSuccessImpl) then,
  ) = __$$MyPostsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Post> posts});
}

/// @nodoc
class __$$MyPostsSuccessImplCopyWithImpl<$Res>
    extends _$MyPostsStateCopyWithImpl<$Res, _$MyPostsSuccessImpl>
    implements _$$MyPostsSuccessImplCopyWith<$Res> {
  __$$MyPostsSuccessImplCopyWithImpl(
    _$MyPostsSuccessImpl _value,
    $Res Function(_$MyPostsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyPostsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? posts = null}) {
    return _then(
      _$MyPostsSuccessImpl(
        null == posts
            ? _value._posts
            : posts // ignore: cast_nullable_to_non_nullable
                  as List<Post>,
      ),
    );
  }
}

/// @nodoc

class _$MyPostsSuccessImpl implements _MyPostsSuccess {
  const _$MyPostsSuccessImpl(final List<Post> posts) : _posts = posts;

  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'MyPostsState.success(posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPostsSuccessImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_posts));

  /// Create a copy of MyPostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPostsSuccessImplCopyWith<_$MyPostsSuccessImpl> get copyWith =>
      __$$MyPostsSuccessImplCopyWithImpl<_$MyPostsSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) success,
    required TResult Function(String message) error,
  }) {
    return success(posts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Post> posts)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MyPostsInitial value) initial,
    required TResult Function(_MyPostsLoading value) loading,
    required TResult Function(_MyPostsSuccess value) success,
    required TResult Function(_MyPostsError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MyPostsInitial value)? initial,
    TResult? Function(_MyPostsLoading value)? loading,
    TResult? Function(_MyPostsSuccess value)? success,
    TResult? Function(_MyPostsError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MyPostsInitial value)? initial,
    TResult Function(_MyPostsLoading value)? loading,
    TResult Function(_MyPostsSuccess value)? success,
    TResult Function(_MyPostsError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _MyPostsSuccess implements MyPostsState {
  const factory _MyPostsSuccess(final List<Post> posts) = _$MyPostsSuccessImpl;

  List<Post> get posts;

  /// Create a copy of MyPostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyPostsSuccessImplCopyWith<_$MyPostsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyPostsErrorImplCopyWith<$Res> {
  factory _$$MyPostsErrorImplCopyWith(
    _$MyPostsErrorImpl value,
    $Res Function(_$MyPostsErrorImpl) then,
  ) = __$$MyPostsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MyPostsErrorImplCopyWithImpl<$Res>
    extends _$MyPostsStateCopyWithImpl<$Res, _$MyPostsErrorImpl>
    implements _$$MyPostsErrorImplCopyWith<$Res> {
  __$$MyPostsErrorImplCopyWithImpl(
    _$MyPostsErrorImpl _value,
    $Res Function(_$MyPostsErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyPostsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$MyPostsErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$MyPostsErrorImpl implements _MyPostsError {
  const _$MyPostsErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MyPostsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPostsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MyPostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPostsErrorImplCopyWith<_$MyPostsErrorImpl> get copyWith =>
      __$$MyPostsErrorImplCopyWithImpl<_$MyPostsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Post> posts)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MyPostsInitial value) initial,
    required TResult Function(_MyPostsLoading value) loading,
    required TResult Function(_MyPostsSuccess value) success,
    required TResult Function(_MyPostsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MyPostsInitial value)? initial,
    TResult? Function(_MyPostsLoading value)? loading,
    TResult? Function(_MyPostsSuccess value)? success,
    TResult? Function(_MyPostsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MyPostsInitial value)? initial,
    TResult Function(_MyPostsLoading value)? loading,
    TResult Function(_MyPostsSuccess value)? success,
    TResult Function(_MyPostsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _MyPostsError implements MyPostsState {
  const factory _MyPostsError(final String message) = _$MyPostsErrorImpl;

  String get message;

  /// Create a copy of MyPostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyPostsErrorImplCopyWith<_$MyPostsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PostCreationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Post post) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Post post)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Post post)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostCreationInitial value) initial,
    required TResult Function(_PostCreationLoading value) loading,
    required TResult Function(_PostCreationSuccess value) success,
    required TResult Function(_PostCreationError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostCreationInitial value)? initial,
    TResult? Function(_PostCreationLoading value)? loading,
    TResult? Function(_PostCreationSuccess value)? success,
    TResult? Function(_PostCreationError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostCreationInitial value)? initial,
    TResult Function(_PostCreationLoading value)? loading,
    TResult Function(_PostCreationSuccess value)? success,
    TResult Function(_PostCreationError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCreationStateCopyWith<$Res> {
  factory $PostCreationStateCopyWith(
    PostCreationState value,
    $Res Function(PostCreationState) then,
  ) = _$PostCreationStateCopyWithImpl<$Res, PostCreationState>;
}

/// @nodoc
class _$PostCreationStateCopyWithImpl<$Res, $Val extends PostCreationState>
    implements $PostCreationStateCopyWith<$Res> {
  _$PostCreationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostCreationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PostCreationInitialImplCopyWith<$Res> {
  factory _$$PostCreationInitialImplCopyWith(
    _$PostCreationInitialImpl value,
    $Res Function(_$PostCreationInitialImpl) then,
  ) = __$$PostCreationInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostCreationInitialImplCopyWithImpl<$Res>
    extends _$PostCreationStateCopyWithImpl<$Res, _$PostCreationInitialImpl>
    implements _$$PostCreationInitialImplCopyWith<$Res> {
  __$$PostCreationInitialImplCopyWithImpl(
    _$PostCreationInitialImpl _value,
    $Res Function(_$PostCreationInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostCreationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PostCreationInitialImpl implements _PostCreationInitial {
  const _$PostCreationInitialImpl();

  @override
  String toString() {
    return 'PostCreationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCreationInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Post post) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Post post)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Post post)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostCreationInitial value) initial,
    required TResult Function(_PostCreationLoading value) loading,
    required TResult Function(_PostCreationSuccess value) success,
    required TResult Function(_PostCreationError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostCreationInitial value)? initial,
    TResult? Function(_PostCreationLoading value)? loading,
    TResult? Function(_PostCreationSuccess value)? success,
    TResult? Function(_PostCreationError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostCreationInitial value)? initial,
    TResult Function(_PostCreationLoading value)? loading,
    TResult Function(_PostCreationSuccess value)? success,
    TResult Function(_PostCreationError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _PostCreationInitial implements PostCreationState {
  const factory _PostCreationInitial() = _$PostCreationInitialImpl;
}

/// @nodoc
abstract class _$$PostCreationLoadingImplCopyWith<$Res> {
  factory _$$PostCreationLoadingImplCopyWith(
    _$PostCreationLoadingImpl value,
    $Res Function(_$PostCreationLoadingImpl) then,
  ) = __$$PostCreationLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostCreationLoadingImplCopyWithImpl<$Res>
    extends _$PostCreationStateCopyWithImpl<$Res, _$PostCreationLoadingImpl>
    implements _$$PostCreationLoadingImplCopyWith<$Res> {
  __$$PostCreationLoadingImplCopyWithImpl(
    _$PostCreationLoadingImpl _value,
    $Res Function(_$PostCreationLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostCreationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PostCreationLoadingImpl implements _PostCreationLoading {
  const _$PostCreationLoadingImpl();

  @override
  String toString() {
    return 'PostCreationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCreationLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Post post) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Post post)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Post post)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostCreationInitial value) initial,
    required TResult Function(_PostCreationLoading value) loading,
    required TResult Function(_PostCreationSuccess value) success,
    required TResult Function(_PostCreationError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostCreationInitial value)? initial,
    TResult? Function(_PostCreationLoading value)? loading,
    TResult? Function(_PostCreationSuccess value)? success,
    TResult? Function(_PostCreationError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostCreationInitial value)? initial,
    TResult Function(_PostCreationLoading value)? loading,
    TResult Function(_PostCreationSuccess value)? success,
    TResult Function(_PostCreationError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _PostCreationLoading implements PostCreationState {
  const factory _PostCreationLoading() = _$PostCreationLoadingImpl;
}

/// @nodoc
abstract class _$$PostCreationSuccessImplCopyWith<$Res> {
  factory _$$PostCreationSuccessImplCopyWith(
    _$PostCreationSuccessImpl value,
    $Res Function(_$PostCreationSuccessImpl) then,
  ) = __$$PostCreationSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Post post});

  $PostCopyWith<$Res> get post;
}

/// @nodoc
class __$$PostCreationSuccessImplCopyWithImpl<$Res>
    extends _$PostCreationStateCopyWithImpl<$Res, _$PostCreationSuccessImpl>
    implements _$$PostCreationSuccessImplCopyWith<$Res> {
  __$$PostCreationSuccessImplCopyWithImpl(
    _$PostCreationSuccessImpl _value,
    $Res Function(_$PostCreationSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostCreationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? post = null}) {
    return _then(
      _$PostCreationSuccessImpl(
        null == post
            ? _value.post
            : post // ignore: cast_nullable_to_non_nullable
                  as Post,
      ),
    );
  }

  /// Create a copy of PostCreationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res> get post {
    return $PostCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value));
    });
  }
}

/// @nodoc

class _$PostCreationSuccessImpl implements _PostCreationSuccess {
  const _$PostCreationSuccessImpl(this.post);

  @override
  final Post post;

  @override
  String toString() {
    return 'PostCreationState.success(post: $post)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCreationSuccessImpl &&
            (identical(other.post, post) || other.post == post));
  }

  @override
  int get hashCode => Object.hash(runtimeType, post);

  /// Create a copy of PostCreationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCreationSuccessImplCopyWith<_$PostCreationSuccessImpl> get copyWith =>
      __$$PostCreationSuccessImplCopyWithImpl<_$PostCreationSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Post post) success,
    required TResult Function(String message) error,
  }) {
    return success(post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Post post)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Post post)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostCreationInitial value) initial,
    required TResult Function(_PostCreationLoading value) loading,
    required TResult Function(_PostCreationSuccess value) success,
    required TResult Function(_PostCreationError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostCreationInitial value)? initial,
    TResult? Function(_PostCreationLoading value)? loading,
    TResult? Function(_PostCreationSuccess value)? success,
    TResult? Function(_PostCreationError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostCreationInitial value)? initial,
    TResult Function(_PostCreationLoading value)? loading,
    TResult Function(_PostCreationSuccess value)? success,
    TResult Function(_PostCreationError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _PostCreationSuccess implements PostCreationState {
  const factory _PostCreationSuccess(final Post post) =
      _$PostCreationSuccessImpl;

  Post get post;

  /// Create a copy of PostCreationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostCreationSuccessImplCopyWith<_$PostCreationSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostCreationErrorImplCopyWith<$Res> {
  factory _$$PostCreationErrorImplCopyWith(
    _$PostCreationErrorImpl value,
    $Res Function(_$PostCreationErrorImpl) then,
  ) = __$$PostCreationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PostCreationErrorImplCopyWithImpl<$Res>
    extends _$PostCreationStateCopyWithImpl<$Res, _$PostCreationErrorImpl>
    implements _$$PostCreationErrorImplCopyWith<$Res> {
  __$$PostCreationErrorImplCopyWithImpl(
    _$PostCreationErrorImpl _value,
    $Res Function(_$PostCreationErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostCreationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$PostCreationErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PostCreationErrorImpl implements _PostCreationError {
  const _$PostCreationErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'PostCreationState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCreationErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of PostCreationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCreationErrorImplCopyWith<_$PostCreationErrorImpl> get copyWith =>
      __$$PostCreationErrorImplCopyWithImpl<_$PostCreationErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Post post) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Post post)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Post post)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostCreationInitial value) initial,
    required TResult Function(_PostCreationLoading value) loading,
    required TResult Function(_PostCreationSuccess value) success,
    required TResult Function(_PostCreationError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostCreationInitial value)? initial,
    TResult? Function(_PostCreationLoading value)? loading,
    TResult? Function(_PostCreationSuccess value)? success,
    TResult? Function(_PostCreationError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostCreationInitial value)? initial,
    TResult Function(_PostCreationLoading value)? loading,
    TResult Function(_PostCreationSuccess value)? success,
    TResult Function(_PostCreationError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _PostCreationError implements PostCreationState {
  const factory _PostCreationError(final String message) =
      _$PostCreationErrorImpl;

  String get message;

  /// Create a copy of PostCreationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostCreationErrorImplCopyWith<_$PostCreationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
