import 'package:get_it/get_it.dart';
import 'package:pokegame/src/features/startup/startup.dart';

import '../../core/data/routing/service/routing_default_route_service.dart';
import '../../core/data/routing/service/routing_redirect_service.dart';
import '../../core/domain/routing/service/routing_default_route_service.dart';
import '../../core/domain/routing/service/routing_redirect_service.dart';
import '../../core/domain/startup/routing_redirect_startup_service.dart';

void setup(GetIt getIt) {
  _setupRoutingService(getIt);
  _setupRoutingDefaultRouteService(getIt);
}

void _setupRoutingService(GetIt getIt) {
  getIt.registerSingleton<RoutingRedirectReplacementService>(
    RoutingRedirectReplacementCompositeService(
      services: [
        getIt<RoutingRedirectStartupService>(),
      ],
    ),
  );
}

void _setupRoutingDefaultRouteService(GetIt getIt) {
  getIt.registerSingleton<RoutingDefaultRouteService>(
    RoutingDefaultRouteServiceImpl(
      defaultAppRouteReplacement: SplashStartupRoute(),
    ),
  );
}
