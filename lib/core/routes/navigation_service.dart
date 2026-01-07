import 'package:flutter/material.dart';

import 'route_arguments.dart';
import 'route_paths.dart';

/// Service for navigating throughout the app without needing BuildContext.
///
/// This service provides type-safe navigation methods that abstract away
/// the complexity of route names and argument passing. It can be injected
/// into BLoCs, ViewModels, or other business logic classes.
///
/// Usage:
/// ```dart
/// // In a BLoC or ViewModel
/// navigationService.goToReputationDetail(user: user);
///
/// // Or with explicit context
/// NavigationService.of(context).pop();
/// ```
class NavigationService {
  static final NavigationService _instance = NavigationService._internal();

  NavigationKey? _navigationKey;

  NavigationService._internal();

  factory NavigationService() {
    return _instance;
  }

  /// Gets the singleton instance of NavigationService
  static NavigationService get instance => _instance;

  /// Gets the NavigationService from the context
  static NavigationService of(BuildContext context) => instance;

  /// Sets the navigation key. Call this in MaterialApp.
  /// Required for navigation without BuildContext.
  void setNavigationKey(GlobalKey<NavigatorState> key) {
    _navigationKey = NavigationKey(key);
  }

  GlobalKey<NavigatorState>? get navigatorKey => _navigationKey?.globalKey;

  NavigatorState? get _navigator => _navigationKey?.globalKey.currentState;

  // ============ Home Routes ============

  /// Navigate to home screen
  Future<dynamic> goToHome() async {
    return _navigator?.pushNamedAndRemoveUntil(
      RoutePaths.home,
      (route) => false,
    );
  }

  // ============ Reputation Routes ============

  /// Navigate to reputation detail screen
  ///
  /// [user] - The user whose reputation history should be displayed
  Future<dynamic> goToReputationDetail({required dynamic user}) async {
    return _navigator?.pushNamed(
      RoutePaths.reputationDetail,
      arguments: ReputationDetailArgs(user: user),
    );
  }

  // ============ Navigation Control ============

  /// Pop the current route and return to the previous screen.
  ///
  /// Optionally pass a [result] to return data to the previous screen.
  ///
  /// Example:
  /// ```dart
  /// // Pop without returning data
  /// NavigationService.instance.pop();
  ///
  /// // Pop and return data
  /// NavigationService.instance.pop(result: 'user_selected');
  /// ```
  void pop<T>({T? result}) {
    _navigator?.pop(result);
  }

  /// Pop routes until a specific route is reached.
  ///
  /// [routeName] - The route to pop until (this route becomes the current one)
  ///
  /// Example:
  /// ```dart
  /// // Pop back to home screen
  /// NavigationService.instance.popUntil(RoutePaths.home);
  ///
  /// // Pop back to user list screen
  /// NavigationService.instance.popUntil(RoutePaths.userList);
  /// ```
  void popUntil(String routeName) {
    _navigator?.popUntil(ModalRoute.withName(routeName));
  }

  /// Pop all routes and return to the root (home) screen.
  ///
  /// This removes all routes from the stack, leaving only the home screen.
  /// Useful for login flows or when you want a fresh start.
  ///
  /// Example:
  /// ```dart
  /// // Return to root after logout
  /// await authService.logout();
  /// NavigationService.instance.popToRoot();
  /// ```
  void popToRoot() {
    _navigator?.popUntil((route) => route.isFirst);
  }

  /// Check if there's a route to pop.
  ///
  /// Returns true if the navigator can pop (not at root), false otherwise.
  ///
  /// Example:
  /// ```dart
  /// if (NavigationService.instance.canPop()) {
  ///   NavigationService.instance.pop();
  /// }
  /// ```
  bool canPop() {
    return _navigator?.canPop() ?? false;
  }

  /// Get the current route.
  ///
  /// Returns the topmost route in the navigation stack.
  Route<dynamic>? get currentRoute =>
      _navigator?.widget.pages.lastOrNull as Route?;
}

/// Wrapper class for navigation key to ensure type safety
class NavigationKey {
  final GlobalKey<NavigatorState> globalKey;

  NavigationKey(this.globalKey);
}
