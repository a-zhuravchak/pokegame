import 'package:pokegame/src/core/domain/startup/startup_service.dart';

import '../../../features/startup/startup.dart';
import '../routing/entity/app_route.dart';
import '../routing/service/routing_redirect_service.dart';
import 'entities/startup_result.dart';

class RoutingRedirectStartupService implements RoutingRedirectService {
  RoutingRedirectStartupService({required this.startupService});

  final StartupService startupService;

  @override
  Future<AppRoute?> getPendingRoute(String? path, dynamic extra) async {
    final result = await startupService.startupResult;

    // Go to `SplashStartupRoute` if startup is not finished
    if (result == null) {
      return SplashStartupRoute();
    }

    if (result is StartupSucceed) {
      return null;
    }

    return null;
  }
}
