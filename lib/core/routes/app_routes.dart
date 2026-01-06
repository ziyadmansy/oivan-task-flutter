import 'package:flutter/material.dart';
import 'package:stackoverflow_users_reputation/modules/reputation/presentation/screens/reputation_detail_screen.dart';
import 'package:stackoverflow_users_reputation/modules/users/domain/entities/user_entity.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/screens/home_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/reputation':
        final user = settings.arguments as UserEntity;
        return MaterialPageRoute(
          builder: (_) => ReputationDetailScreen(user: user),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
