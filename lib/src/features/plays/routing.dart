import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'plays.dart';

List<RouteBase> createRoutesForShell() {
  final external = <RouteBase>[
    GoRoute(
        path: PlaysInitialRoute().goRouterPath,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: Scaffold(key: PlaysKeys.plays));
        }),
  ];
  final internal = <RouteBase>[];

  return external + internal;
}
