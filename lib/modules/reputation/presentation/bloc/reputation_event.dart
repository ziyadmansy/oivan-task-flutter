import 'package:freezed_annotation/freezed_annotation.dart';

part 'reputation_event.freezed.dart';

@freezed
class ReputationEvent with _$ReputationEvent {
  const factory ReputationEvent.fetchNextPage({
    required int userId,
    @Default(1) int pageKey,
    @Default(30) int pageSize,
  }) = _FetchNextPageEvent;

  const factory ReputationEvent.refreshReputationHistory({
    required int userId,
    @Default(30) int pageSize,
  }) = _RefreshReputationHistoryEvent;
}
