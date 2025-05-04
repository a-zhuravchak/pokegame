import 'package:go_router/go_router.dart';

import '../startup.dart';
import 'splash/splash_page.dart';

List<RouteBase> createRoutes({required GoRouterRedirect redirect}) {
  final external = <RouteBase>[
    GoRoute(
        path: SplashStartupRoute().goRouterPath,
        redirect: redirect,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: SplashPage());
        }),
  ];
  final internal = <RouteBase>[];

  return external + internal;
}
