import 'package:pokegame/src/features/plays/plays.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> createRoutesForShell() {
  final List<RouteBase> external = [
    GoRoute(
        path: PlaysInitialRoute().goRouterPath,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: Scaffold(key: PlaysKeys.plays));
        }),
  ];
  final List<RouteBase> internal = [];
  return external + internal;
}
