import 'package:flutter/material.dart';
import 'package:stackoverflow_users_reputation/modules/reputation/presentation/screens/reputation_detail_screen.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/screens/home_screen.dart';

import 'route_arguments.dart';
import 'route_paths.dart';

/// Central route generator that handles all navigation in the app.
/// This class is responsible for:
/// - Creating routes based on route names and arguments
/// - Providing type-safe navigation
/// - Validating arguments before route creation
/// - Handling unknown routes
class AppRouteGenerator {
  /// Generates a route for the given [settings].
  ///
  /// This method is called by the Navigator when a route is requested.
  /// It handles route creation and argument validation.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        // Home Routes
        case RoutePaths.home:
          return MaterialPageRoute(
            builder: (_) => const HomeScreen(),
            settings: settings,
          );

        // Reputation Routes
        case RoutePaths.reputationDetail:
          final args = settings.arguments as ReputationDetailArgs?;
          if (args == null) {
            return _errorRoute(
              'Missing required arguments for reputation detail route',
              settings,
            );
          }
          return MaterialPageRoute(
            builder: (_) => ReputationDetailScreen(user: args.user),
            settings: settings,
          );

        // Unknown Route
        default:
          return _errorRoute('Unknown route: ${settings.name}', settings);
      }
    } catch (e) {
      return _errorRoute('Error navigating to ${settings.name}: $e', settings);
    }
  }

  /// Creates an error route that displays an error message.
  /// This is used when a route is not found or arguments are invalid.
  static Route<dynamic> _errorRoute(String message, RouteSettings settings) {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(child: Text(message)),
          ),
      settings: settings,
    );
  }

  /// Creates a transition route with custom animation.
  /// Useful for routes that need special transitions.
  static Route<T> createTransitionRoute<T>({
    required RouteSettings settings,
    required WidgetBuilder builder,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: duration,
    );
  }
}
