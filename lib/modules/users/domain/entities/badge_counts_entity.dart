import 'package:equatable/equatable.dart';

class BadgeCountsEntity extends Equatable {
  final int bronze;
  final int silver;
  final int gold;

  const BadgeCountsEntity({
    required this.bronze,
    required this.silver,
    required this.gold,
  });

  int get total => bronze + silver + gold;

  @override
  List<Object?> get props => [bronze, silver, gold];
}
