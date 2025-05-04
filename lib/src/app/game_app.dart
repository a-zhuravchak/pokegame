import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/presentation/widgets/overlay/styled_overlay.dart';
import 'di/di.dart';
import 'router/app_router.dart';
import 'theme/util.dart';

class GameApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const GameApp({
    super.key,
    required this.navigatorKey,
  });

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
