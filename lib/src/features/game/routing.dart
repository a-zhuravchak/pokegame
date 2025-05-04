import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'game.dart';
import 'pages/result/result_page.dart';
import 'pages/round/round_page.dart';

List<RouteBase> createRoutes({required GoRouterRedirect redirect}) {
  final external = <RouteBase>[
    GoRoute(
      path: GameInitialRoute().goRouterPath,
      name: GameInitialRoute().routeName,
      redirect: redirect,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
            child: RoundPage(
          key: ValueKey('game'),
        ));
      },
    ),
    GoRoute(
      path: GameResultRoute().goRouterPath,
      name: GameResultRoute().routeName,
      redirect: redirect,
      pageBuilder: (context, state) {
        final arguments = state.extra as GameResultArguments?;
        if (arguments == null) {
          throw Exception('Arguments must be provided');
        }

        return NoTransitionPage(
          child: ResultPage(
            isSuccess: arguments.answerCorrect,
            pokemon: arguments.pokemon,
          ),
        );
      },
    ),
  ];

  final internal = <RouteBase>[];
  return external + internal;
}
