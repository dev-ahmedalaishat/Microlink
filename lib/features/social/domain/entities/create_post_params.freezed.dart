// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_post_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CreatePostParams {
  String get content => throw _privateConstructorUsedError;
  List<String> get mediaUrls => throw _privateConstructorUsedError;

  /// Create a copy of CreatePostParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePostParamsCopyWith<CreatePostParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostParamsCopyWith<$Res> {
  factory $CreatePostParamsCopyWith(
    CreatePostParams value,
    $Res Function(CreatePostParams) then,
  ) = _$CreatePostParamsCopyWithImpl<$Res, CreatePostParams>;
  @useResult
  $Res call({String content, List<String> mediaUrls});
}

/// @nodoc
class _$CreatePostParamsCopyWithImpl<$Res, $Val extends CreatePostParams>
    implements $CreatePostParamsCopyWith<$Res> {
  _$CreatePostParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePostParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? mediaUrls = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreatePostParamsImplCopyWith<$Res>
    implements $CreatePostParamsCopyWith<$Res> {
  factory _$$CreatePostParamsImplCopyWith(
    _$CreatePostParamsImpl value,
    $Res Function(_$CreatePostParamsImpl) then,
  ) = __$$CreatePostParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, List<String> mediaUrls});
}

/// @nodoc
class __$$CreatePostParamsImplCopyWithImpl<$Res>
    extends _$CreatePostParamsCopyWithImpl<$Res, _$CreatePostParamsImpl>
    implements _$$CreatePostParamsImplCopyWith<$Res> {
  __$$CreatePostParamsImplCopyWithImpl(
    _$CreatePostParamsImpl _value,
    $Res Function(_$CreatePostParamsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreatePostParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? mediaUrls = null}) {
    return _then(
      _$CreatePostParamsImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        mediaUrls: null == mediaUrls
            ? _value._mediaUrls
            : mediaUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$CreatePostParamsImpl implements _CreatePostParams {
  const _$CreatePostParamsImpl({
    required this.content,
    final List<String> mediaUrls = const [],
  }) : _mediaUrls = mediaUrls;

  @override
  final String content;
  final List<String> _mediaUrls;
  @override
  @JsonKey()
  List<String> get mediaUrls {
    if (_mediaUrls is EqualUnmodifiableListView) return _mediaUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaUrls);
  }

  @override
  String toString() {
    return 'CreatePostParams(content: $content, mediaUrls: $mediaUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostParamsImpl &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(
              other._mediaUrls,
              _mediaUrls,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    content,
    const DeepCollectionEquality().hash(_mediaUrls),
  );

  /// Create a copy of CreatePostParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostParamsImplCopyWith<_$CreatePostParamsImpl> get copyWith =>
      __$$CreatePostParamsImplCopyWithImpl<_$CreatePostParamsImpl>(
        this,
        _$identity,
      );
}

abstract class _CreatePostParams implements CreatePostParams {
  const factory _CreatePostParams({
    required final String content,
    final List<String> mediaUrls,
  }) = _$CreatePostParamsImpl;

  @override
  String get content;
  @override
  List<String> get mediaUrls;

  /// Create a copy of CreatePostParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePostParamsImplCopyWith<_$CreatePostParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
