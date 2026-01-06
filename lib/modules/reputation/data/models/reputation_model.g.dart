// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reputation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReputationModelImpl _$$ReputationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReputationModelImpl(
      reputationHistoryType: json['reputation_history_type'] as String,
      userId: (json['user_id'] as num).toInt(),
      reputationChange: (json['reputation_change'] as num).toInt(),
      creationDate: (json['creation_date'] as num).toInt(),
      postId: (json['post_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReputationModelImplToJson(
        _$ReputationModelImpl instance) =>
    <String, dynamic>{
      'reputation_history_type': instance.reputationHistoryType,
      'user_id': instance.userId,
      'reputation_change': instance.reputationChange,
      'creation_date': instance.creationDate,
      'post_id': instance.postId,
    };
