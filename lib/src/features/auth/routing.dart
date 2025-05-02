import 'package:go_router/go_router.dart';
import 'package:pokegame/src/features/auth/pages/auth_page.dart';

import 'auth.dart';

List<RouteBase> createRoutes({required GoRouterRedirect redirect}) {
  final List<RouteBase> external = [
    GoRoute(
        path: AuthInitialRoute().goRouterPath,
        redirect: redirect,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: AuthPage());
        }),
  ];
  final List<RouteBase> internal = [];
  return external + internal;
}
