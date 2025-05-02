import '../../core/domain/routing/entity/app_route.dart';

sealed class AuthRoute extends AppRoute {}

final class AuthInitialRoute extends AuthRoute {
  @override
  String get routeName => '/auth';
}
