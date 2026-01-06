import 'package:freezed_annotation/freezed_annotation.dart';

part 'reputation_event.freezed.dart';

@freezed
class ReputationEvent with _$ReputationEvent {
  const factory ReputationEvent.loadReputationHistory({
    required int userId,
    @Default(1) int page,
    @Default(30) int pageSize,
  }) = _LoadReputationHistoryEvent;
}
