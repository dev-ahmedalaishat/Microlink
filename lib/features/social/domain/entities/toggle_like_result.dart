import 'package:freezed_annotation/freezed_annotation.dart';

part 'toggle_like_result.freezed.dart';

@freezed
class ToggleLikeResult with _$ToggleLikeResult {
  const factory ToggleLikeResult({
    required bool isLiked,
    required int likesCount,
  }) = _ToggleLikeResult;
}
