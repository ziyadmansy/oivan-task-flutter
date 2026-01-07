import 'package:equatable/equatable.dart';
import 'badge_counts_entity.dart';

class UserEntity extends Equatable {
  final int userId;
  final String displayName;
  final String? profileImage;
  final int reputation;
  final BadgeCountsEntity? badgeCounts;
  final String? location;
  final String? websiteUrl;
  final bool isBookmarked;

  const UserEntity({
    required this.userId,
    required this.displayName,
    this.profileImage,
    required this.reputation,
    this.badgeCounts,
    this.location,
    this.websiteUrl,
    required this.isBookmarked,
  });

  UserEntity copyWith({
    int? userId,
    String? displayName,
    String? profileImage,
    int? reputation,
    BadgeCountsEntity? badgeCounts,
    String? location,
    String? websiteUrl,
    bool? isBookmarked,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      displayName: displayName ?? this.displayName,
      profileImage: profileImage ?? this.profileImage,
      reputation: reputation ?? this.reputation,
      badgeCounts: badgeCounts ?? this.badgeCounts,
      location: location ?? this.location,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  @override
  List<Object?> get props => [
    userId,
    displayName,
    profileImage,
    reputation,
    badgeCounts,
    location,
    websiteUrl,
    isBookmarked,
  ];
}
