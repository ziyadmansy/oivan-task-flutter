// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reputation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReputationModelImpl _$$ReputationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReputationModelImpl(
      reputationHistoryId: (json['reputation_history_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      reputationType: json['reputation_type'] as String,
      reputationChange: (json['reputation_change'] as num).toInt(),
      creationDate: (json['creation_date'] as num).toInt(),
      postId: (json['post_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReputationModelImplToJson(
        _$ReputationModelImpl instance) =>
    <String, dynamic>{
      'reputation_history_id': instance.reputationHistoryId,
      'user_id': instance.userId,
      'reputation_type': instance.reputationType,
      'reputation_change': instance.reputationChange,
      'creation_date': instance.creationDate,
      'post_id': instance.postId,
    };
