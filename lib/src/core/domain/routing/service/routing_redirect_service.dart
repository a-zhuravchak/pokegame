import '../entity/app_route.dart';

/// Service able to redirect on path
abstract class RoutingRedirectService {
  Future<AppRoute?> getPendingRoute(String? path, dynamic extra);
}

abstract class RoutingRedirectReplacementService implements RoutingRedirectService {
  Future<void> storeReplacement(String replacement);

  Future<String?> obtainPendingReplacement();
}
