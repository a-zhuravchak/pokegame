import 'package:pokegame/src/features/startup/pages/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

import '../startup.dart';

List<RouteBase> createRoutes({required GoRouterRedirect redirect}) {
  final List<RouteBase> external = [
    GoRoute(
        path: SplashStartupRoute().goRouterPath,
        redirect: redirect,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: SplashPage());
        }),
  ];
  final List<RouteBase> internal = [];
  return external + internal;
}
