import 'package:stackoverflow_users_reputation/modules/users/domain/entities/user_entity.dart';

/// Arguments for the reputation detail screen
class ReputationDetailArgs {
  final UserEntity user;

  const ReputationDetailArgs({required this.user});
}

/// Arguments for user details screen
class UserDetailsArgs {
  final UserEntity user;
  final bool showBookmarks;

  const UserDetailsArgs({required this.user, this.showBookmarks = false});
}

/// Arguments for user search screen
class UserSearchArgs {
  final String? initialQuery;
  final bool autoFocus;

  const UserSearchArgs({this.initialQuery, this.autoFocus = true});
}
