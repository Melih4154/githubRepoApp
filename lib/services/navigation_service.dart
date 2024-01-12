import 'package:flutter/material.dart';

import '../routes.dart';

final navService = NavigationService();

class NavigationService {
  final navigatorKey = GlobalKey<NavigatorState>();

  String currentRoute = '/home';
  String? previousRoute;

  GuardedRoute? currentGuardedRoute;

  NavigatorState get state => navigatorKey.currentState!;

  BuildContext get context => navigatorKey.currentState!.context;

  void updateRoutes(String path) {
    previousRoute = currentRoute;
    currentRoute = path;
  }

  Future<T?>? toNamed<T>(String path, {Object? args}) {
    updateRoutes(path);

    return null;
  }

  Future<T?>? offNamed<T>(String path, {Object? args}) {
    updateRoutes(path);

    return state.pushReplacementNamed(path, arguments: args);
  }

  Future<T?>? offAllNamed<T>(String path, {Object? args, int? id}) {
    updateRoutes(path);

    return state.pushNamedAndRemoveUntil(path, (_) => false, arguments: args);
  }

  void back<T extends Object?>([T? result]) {
    if (state.canPop()) {
      currentRoute = previousRoute!;
      state.pop(result);
    }
  }
}
