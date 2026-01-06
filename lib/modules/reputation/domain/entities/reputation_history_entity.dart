import 'package:equatable/equatable.dart';

class ReputationHistoryEntity extends Equatable {
  final String reputationHistoryType;
  final int userId;
  final int reputationChange;
  final DateTime createdAt;
  final int? postId;

  const ReputationHistoryEntity({
    required this.reputationHistoryType,
    required this.userId,
    required this.reputationChange,
    required this.createdAt,
    this.postId,
  });

  @override
  List<Object?> get props => [
    reputationHistoryType,
    userId,
    reputationChange,
    createdAt,
    postId,
  ];
}
