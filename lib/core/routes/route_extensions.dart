import 'package:flutter/material.dart';

import 'navigation_service.dart';

/// Extension methods for easier navigation with BuildContext.
///
/// These extensions provide convenient navigation methods directly on BuildContext,
/// making it easy to navigate from UI widgets.
///
/// Usage:
/// ```dart
/// context.goToReputationDetail(user: user);
/// context.pop();
/// ```
extension NavigationExtension on BuildContext {
  /// Navigate to reputation detail screen
  Future<dynamic> goToReputationDetail({required dynamic user}) {
    return NavigationService.of(this).goToReputationDetail(user: user);
  }

  /// Navigate to home screen
  Future<dynamic> goToHome() {
    return NavigationService.of(this).goToHome();
  }

  /// Pop the current route and return to the previous screen.
  ///
  /// Optionally pass a [result] to return data to the previous screen.
  ///
  /// Example:
  /// ```dart
  /// context.pop();
  /// context.pop(result: 'user_selected');
  /// ```
  void pop<T>({T? result}) {
    NavigationService.of(this).pop(result: result);
  }

  /// Pop routes until a specific route is reached.
  ///
  /// Example:
  /// ```dart
  /// context.popUntil(RoutePaths.home);
  /// ```
  void popUntil(String routeName) {
    NavigationService.of(this).popUntil(routeName);
  }

  /// Pop all routes and return to the root (home) screen.
  ///
  /// Example:
  /// ```dart
  /// context.popToRoot();
  /// ```
  void popToRoot() {
    NavigationService.of(this).popToRoot();
  }

  /// Check if there's a route to pop
  bool canPop() {
    return NavigationService.of(this).canPop();
  }
}
