import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:microlink/core/constants/app_constants.dart';
import 'package:microlink/features/social/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'user_id') required String id,
    @JsonKey(name: 'username') required String name,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'unit_details') String? unitDetails,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  User toDomain(String loggedUserId) => User(
    id: id,
    name: loggedUserId == id ? 'You' : name,
    avatarUrl: AppConstants.getRandomAvatar(id),
    unitDetails: unitDetails,
    isVerified: isVerified,
  );
}

extension UserX on User {
  UserModel toModel() => UserModel(
    id: id,
    name: name,
    avatarUrl: avatarUrl,
    unitDetails: unitDetails,
    isVerified: isVerified,
  );
}
