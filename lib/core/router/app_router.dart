import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/auth/presentation/login_screen.dart';
import 'package:my_market/features/home/presentation/home_screen.dart';

import '/core/widgets/shared/app_error_screen.dart';

enum AppRoutes {
  login('login'),
  home('home');

  const AppRoutes(this.route);
  final String route;
}

final goRouterProvider = Provider(
  (ref) => GoRouter(
    debugLogDiagnostics: kDebugMode ? true : false,
    initialLocation: '/home',
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: AppRoutes.login.route,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: AppRoutes.home.route,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    errorBuilder: (context, state) => const AppErrorScreen(),
  ),
);
