import 'package:get_it/get_it.dart';

import '../../core/domain/startup/routing_redirect_startup_service.dart';
import '../../core/domain/startup/startup_service.dart';

Future<void> setup(GetIt getIt) async {
  _setupStartupService(getIt);
  _setupRoutingStartupService(getIt);
}

void _setupStartupService(GetIt getIt) {
  getIt.registerSingleton<StartupService>(
    StartupDefaultService(),
    // dispose: (service) async => await service.reset(),
  );
}

void _setupRoutingStartupService(GetIt getIt) {
  getIt.registerSingleton<RoutingRedirectStartupService>(
    RoutingRedirectStartupService(startupService: getIt()),
  );
}
