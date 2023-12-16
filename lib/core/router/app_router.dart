import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/utils/network.dart';
import 'package:my_market/features/auth/presentation/login_screen.dart';
import 'package:my_market/features/cashier/presentation/cashier_screen.dart';
import 'package:my_market/features/home/presentation/home_screen.dart';
import 'package:my_market/features/users/presentation/user_controller.dart';

import '/core/widgets/shared/app_error_screen.dart';

enum AppRoutes {
  login('login'),
  home('home'),
  cashier('cashier');

  const AppRoutes(this.route);
  final String route;
}

final goRouterProvider = Provider(
  (ref) {
    return GoRouter(
      debugLogDiagnostics: kDebugMode ? true : false,
      initialLocation: '/login',
      redirect: (context, state) {
        final user = ref.watch(userProvider);
        return user != null ? '/home' : null;
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
        GoRoute(
          path: '/cashier',
          name: AppRoutes.cashier.route,
          builder: (context, state) => const CashierScreen(),
        ),
      ],
      errorBuilder: (context, state) => const AppErrorScreen(),
    );
  },
);

// TODO: Move to another File
_connectionProviderlistener(
  ProviderRef ref,
  BuildContext context,
) async {
  ref.listen(
    currentConnectionProvider.select((value) => value.connectionStatus),
    (previous, next) async {
      if (previous != next) {
        return switch (next) {
          null => null,
          InternetConnectionStatus.disconnected => context.showBanner(
              content: const Text('No Internet Connection'),
              onClose: () {},
            ),
          InternetConnectionStatus.connected => context.showBanner(
              content: const Text('Internet Connected'),
              duration: const Duration(seconds: 2),
              onClose: () {},
            ),
        };
      }
    },
  );
}
