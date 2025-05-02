import '../../../domain/routing/entity/app_route.dart';
import '../../../domain/routing/service/routing_redirect_service.dart';

class RoutingRedirectReplacementCompositeService implements RoutingRedirectReplacementService {
  RoutingRedirectReplacementCompositeService({required this.services});

  final List<RoutingRedirectService> services;

  String? _pendingReplacement;

  @override
  Future<AppRoute?> getPendingRoute(String? path, dynamic extra) async {
    for (final service in services) {
      final route = await service.getPendingRoute(path, extra);
      if (route != null) {
        return route;
      }
    }
    return null;
  }

  @override
  Future<void> storeReplacement(String replacement) async {
    _pendingReplacement = replacement;
  }

  @override
  Future<String?> obtainPendingReplacement() async {
    final replacement = _pendingReplacement;
    _pendingReplacement = null;
    return replacement;
  }
}
