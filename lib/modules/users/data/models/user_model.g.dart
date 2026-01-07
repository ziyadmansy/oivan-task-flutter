// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: (json['user_id'] as num).toInt(),
      displayName: json['display_name'] as String,
      profileImage: json['profile_image'] as String?,
      reputation: (json['reputation'] as num).toInt(),
      badgeCounts: json['badge_counts'] == null
          ? null
          : BadgeCountsModel.fromJson(
              json['badge_counts'] as Map<String, dynamic>),
      location: json['location'] as String?,
      websiteUrl: json['website_url'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'display_name': instance.displayName,
      'profile_image': instance.profileImage,
      'reputation': instance.reputation,
      'badge_counts': instance.badgeCounts,
      'location': instance.location,
      'website_url': instance.websiteUrl,
    };
