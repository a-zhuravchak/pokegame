import '../../core/domain/routing/routing.dart';

sealed class StartupRoute extends AppRoute {}

final class SplashStartupRoute extends StartupRoute {
  @override
  String get routeName => '/splash';
}
