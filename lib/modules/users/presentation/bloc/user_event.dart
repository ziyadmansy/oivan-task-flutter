import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'user_event.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.loadUsers({
    @Default(1) int page,
    @Default(30) int pageSize,
  }) = _LoadUsersEvent;

  const factory UserEvent.loadBookmarkedUsers() = _LoadBookmarkedUsersEvent;

  const factory UserEvent.toggleBookmark(UserEntity user) =
      _ToggleBookmarkEvent;

  const factory UserEvent.filterByBookmark({required bool showOnlyBookmarked}) =
      _FilterByBookmarkEvent;
}
