import 'package:freezed_annotation/freezed_annotation.dart';

part 'reputation_model.freezed.dart';
part 'reputation_model.g.dart';

@freezed
class ReputationModel with _$ReputationModel {
  const factory ReputationModel({
    @JsonKey(name: 'reputation_history_id') required int reputationHistoryId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'reputation_type') required String reputationType,
    @JsonKey(name: 'reputation_change') required int reputationChange,
    @JsonKey(name: 'creation_date') required int creationDate,
    @JsonKey(name: 'post_id') int? postId,
  }) = _ReputationModel;

  factory ReputationModel.fromJson(Map<String, dynamic> json) =>
      _$ReputationModelFromJson(json);
}
