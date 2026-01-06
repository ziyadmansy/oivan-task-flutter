import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int userId;
  final String displayName;
  final String? profileImage;
  final int reputation;
  final int? badgeCount;
  final bool isBookmarked;

  const UserEntity({
    required this.userId,
    required this.displayName,
    this.profileImage,
    required this.reputation,
    this.badgeCount,
    required this.isBookmarked,
  });

  UserEntity copyWith({
    int? userId,
    String? displayName,
    String? profileImage,
    int? reputation,
    int? badgeCount,
    bool? isBookmarked,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      displayName: displayName ?? this.displayName,
      profileImage: profileImage ?? this.profileImage,
      reputation: reputation ?? this.reputation,
      badgeCount: badgeCount ?? this.badgeCount,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  @override
  List<Object?> get props => [
    userId,
    displayName,
    profileImage,
    reputation,
    badgeCount,
    isBookmarked,
  ];
}
