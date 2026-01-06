import 'package:equatable/equatable.dart';

class ReputationHistoryEntity extends Equatable {
  final int reputationHistoryId;
  final int userId;
  final String reputationType;
  final int reputationChange;
  final DateTime createdAt;
  final int? postId;

  const ReputationHistoryEntity({
    required this.reputationHistoryId,
    required this.userId,
    required this.reputationType,
    required this.reputationChange,
    required this.createdAt,
    this.postId,
  });

  @override
  List<Object?> get props => [
    reputationHistoryId,
    userId,
    reputationType,
    reputationChange,
    createdAt,
    postId,
  ];
}
