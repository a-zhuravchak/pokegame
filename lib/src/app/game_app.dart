import 'package:pokegame/src/app/di/di.dart';
import 'package:pokegame/src/app/router/app_router.dart';
import 'package:pokegame/src/app/theme/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/presentation/widgets/overlay/styled_overlay.dart';

class GameApp extends StatefulWidget {
  const GameApp({
    super.key,
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late GoRouter router;

  @override
  void initState() {
    super.initState();
    router = createRouter(
      widget.navigatorKey,
      redirectService: getIt(),
      defaultRoutingService: getIt(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BG Tracker',
      theme: createAppTheme(context),
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      builder: setupLoading(),
    );
  }
}

TransitionBuilder setupLoading() {
  return StyledOverlay.init();
}
