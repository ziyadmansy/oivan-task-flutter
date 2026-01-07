import 'package:freezed_annotation/freezed_annotation.dart';
import 'badge_counts_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'profile_image') String? profileImage,
    required int reputation,
    @JsonKey(name: 'badge_counts') BadgeCountsModel? badgeCounts,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'website_url') String? websiteUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
