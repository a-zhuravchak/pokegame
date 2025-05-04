import '../../../features/startup/startup.dart';
import '../routing/entity/app_route.dart';
import '../routing/service/routing_redirect_service.dart';
import 'entities/startup_result.dart';
import 'startup_service.dart';

class RoutingRedirectStartupService implements RoutingRedirectService {
  final StartupService startupService;

  RoutingRedirectStartupService({required this.startupService});

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
