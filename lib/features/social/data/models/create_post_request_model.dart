import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/create_post_params.dart';

part 'create_post_request_model.freezed.dart';
part 'create_post_request_model.g.dart';

@freezed
class CreatePostRequestModel with _$CreatePostRequestModel {
  const factory CreatePostRequestModel({
    required String content,
    @JsonKey(name: 'media_urls') @Default([]) List<String> mediaUrls,
    @JsonKey(name: 'user_id') required String userId,
  }) = _CreatePostRequestModel;

  factory CreatePostRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePostRequestModelFromJson(json);

  factory CreatePostRequestModel.fromEntity(
    CreatePostParams params,
    String userId,
  ) => CreatePostRequestModel(
    content: params.content,
    mediaUrls: params.mediaUrls,
    userId: userId,
  );
}
