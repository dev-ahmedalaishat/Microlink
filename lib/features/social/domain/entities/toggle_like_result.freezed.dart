// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toggle_like_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ToggleLikeResult {
  bool get isLiked => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;

  /// Create a copy of ToggleLikeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToggleLikeResultCopyWith<ToggleLikeResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleLikeResultCopyWith<$Res> {
  factory $ToggleLikeResultCopyWith(
    ToggleLikeResult value,
    $Res Function(ToggleLikeResult) then,
  ) = _$ToggleLikeResultCopyWithImpl<$Res, ToggleLikeResult>;
  @useResult
  $Res call({bool isLiked, int likesCount});
}

/// @nodoc
class _$ToggleLikeResultCopyWithImpl<$Res, $Val extends ToggleLikeResult>
    implements $ToggleLikeResultCopyWith<$Res> {
  _$ToggleLikeResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ToggleLikeResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLiked = null, Object? likesCount = null}) {
    return _then(
      _value.copyWith(
            isLiked: null == isLiked
                ? _value.isLiked
                : isLiked // ignore: cast_nullable_to_non_nullable
                      as bool,
            likesCount: null == likesCount
                ? _value.likesCount
                : likesCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ToggleLikeResultImplCopyWith<$Res>
    implements $ToggleLikeResultCopyWith<$Res> {
  factory _$$ToggleLikeResultImplCopyWith(
    _$ToggleLikeResultImpl value,
    $Res Function(_$ToggleLikeResultImpl) then,
  ) = __$$ToggleLikeResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLiked, int likesCount});
}

/// @nodoc
class __$$ToggleLikeResultImplCopyWithImpl<$Res>
    extends _$ToggleLikeResultCopyWithImpl<$Res, _$ToggleLikeResultImpl>
    implements _$$ToggleLikeResultImplCopyWith<$Res> {
  __$$ToggleLikeResultImplCopyWithImpl(
    _$ToggleLikeResultImpl _value,
    $Res Function(_$ToggleLikeResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ToggleLikeResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLiked = null, Object? likesCount = null}) {
    return _then(
      _$ToggleLikeResultImpl(
        isLiked: null == isLiked
            ? _value.isLiked
            : isLiked // ignore: cast_nullable_to_non_nullable
                  as bool,
        likesCount: null == likesCount
            ? _value.likesCount
            : likesCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$ToggleLikeResultImpl implements _ToggleLikeResult {
  const _$ToggleLikeResultImpl({
    required this.isLiked,
    required this.likesCount,
  });

  @override
  final bool isLiked;
  @override
  final int likesCount;

  @override
  String toString() {
    return 'ToggleLikeResult(isLiked: $isLiked, likesCount: $likesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleLikeResultImpl &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLiked, likesCount);

  /// Create a copy of ToggleLikeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleLikeResultImplCopyWith<_$ToggleLikeResultImpl> get copyWith =>
      __$$ToggleLikeResultImplCopyWithImpl<_$ToggleLikeResultImpl>(
        this,
        _$identity,
      );
}

abstract class _ToggleLikeResult implements ToggleLikeResult {
  const factory _ToggleLikeResult({
    required final bool isLiked,
    required final int likesCount,
  }) = _$ToggleLikeResultImpl;

  @override
  bool get isLiked;
  @override
  int get likesCount;

  /// Create a copy of ToggleLikeResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleLikeResultImplCopyWith<_$ToggleLikeResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
