import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/reputation_usecases.dart';
import 'reputation_event.dart';
import 'reputation_state.dart';

class ReputationBloc extends Bloc<ReputationEvent, ReputationState> {
  final GetReputationHistoryUseCase getReputationHistoryUseCase;

  ReputationBloc({required this.getReputationHistoryUseCase})
    : super(const ReputationState.initial()) {
    on<ReputationEvent>(_onLoadReputationHistory);
  }

  Future<void> _onLoadReputationHistory(
    ReputationEvent event,
    Emitter<ReputationState> emit,
  ) async {
    emit(const ReputationState.loading());
    try {
      final reputations = await getReputationHistoryUseCase(
        userId: event.userId,
        page: event.page,
        pageSize: event.pageSize,
      );
      emit(ReputationState.loaded(reputations));
    } catch (e) {
      emit(
        ReputationState.error(
          'Failed to load reputation history: ${e.toString()}',
        ),
      );
    }
  }
}
