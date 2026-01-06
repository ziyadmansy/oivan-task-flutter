import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/reputation_history_entity.dart';

part 'reputation_state.freezed.dart';

@freezed
class ReputationState with _$ReputationState {
  const factory ReputationState.initial() = _InitialState;

  const factory ReputationState.loading() = _LoadingState;

  const factory ReputationState.loaded(
    List<ReputationHistoryEntity> reputations,
  ) = _LoadedState;

  const factory ReputationState.error(String message) = _ErrorState;
}
