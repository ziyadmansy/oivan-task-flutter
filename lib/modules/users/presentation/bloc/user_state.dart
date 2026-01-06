import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _InitialState;

  const factory UserState.loading() = _LoadingState;

  const factory UserState.loaded({
    required List<UserEntity> users,
    @Default(false) bool showOnlyBookmarked,
  }) = _LoadedState;

  const factory UserState.error(String message) = _ErrorState;
}
