import 'package:flutter/cupertino.dart';
import 'package:github_repo_projects/pages/home/home_page.dart';
import 'package:github_repo_projects/pages/others/no_connection_page.dart';
import 'package:github_repo_projects/pages/others/not_found_page.dart';
import 'package:github_repo_projects/pages/others/server_error_page.dart';
import 'package:github_repo_projects/pages/splash/splash_page.dart';
import 'package:github_repo_projects/services/navigation_service.dart';
import 'package:github_repo_projects/utils/enums.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String serverError = '/serverError';
  static const String noConnection = '/noConnection';

  static final guardedRoutes = [
    GuardedRoute(
      path: splash,
      page: const SplashPage(),
      roles: [Role.guest],
    ),
    GuardedRoute(
      path: home,
      page: HomePage(),
      roles: [Role.guest],
    ),
    GuardedRoute(
      path: serverError,
      page: const ServerErrorPage(),
      roles: [Role.guest],
    ),
    GuardedRoute(
      path: noConnection,
      page: const NoConnectionPage(),
      roles: [Role.guest],
    ),
  ];

  static Route? generateRoute(RouteSettings settings) {
    final path = settings.name!;

    bool isContain = false;

    GuardedRoute? currentRoute;

    for (var i = 0; i < guardedRoutes.length; i++) {
      isContain = guardedRoutes[i].path.contains(path);
      if (isContain) {
        currentRoute = guardedRoutes[i];
        break;
      }
    }
    if (!isContain) {
      currentRoute = GuardedRoute(
        path: '/not-found',
        page: NotFoundPage(path),
        roles: [Role.user, Role.guest],
      );
    }
    navService.currentGuardedRoute = currentRoute!;
    return CupertinoPageRoute(builder: (_) => currentRoute!.page);
  }
}

class GuardedRoute {
  final String path;
  final Widget page;
  final List<Role> roles;

  GuardedRoute({
    required this.path,
    required this.page,
    required this.roles,
  });
}
