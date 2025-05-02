import '../../../domain/routing/entity/app_route.dart';
import '../../../domain/routing/service/routing_default_route_service.dart';

class RoutingDefaultRouteServiceImpl implements RoutingDefaultRouteService {
  RoutingDefaultRouteServiceImpl({required this.defaultAppRouteReplacement});

  final AppRoute defaultAppRouteReplacement;

  @override
  Future<AppRoute> defaultRouteReplacement() async {
    return defaultAppRouteReplacement;
  }
}
