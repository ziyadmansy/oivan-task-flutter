import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'profile_image') String? profileImage,
    required int reputation,
    @JsonKey(name: 'badge_count') int? badgeCount,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
