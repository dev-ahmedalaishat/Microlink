import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_post_params.freezed.dart';

@freezed
class CreatePostParams with _$CreatePostParams {
  const factory CreatePostParams({
    required String content,
    @Default([]) List<String> mediaUrls,
  }) = _CreatePostParams;
}
