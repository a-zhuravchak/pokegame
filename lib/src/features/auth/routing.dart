import 'package:go_router/go_router.dart';

import 'auth.dart';
import 'pages/auth_page.dart';

List<RouteBase> createRoutes({required GoRouterRedirect redirect}) {
  final external = <RouteBase>[
    GoRoute(
        path: AuthInitialRoute().goRouterPath,
        redirect: redirect,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: AuthPage());
        }),
  ];
  final internal = <RouteBase>[];

  return external + internal;
}
