import 'package:pokegame/src/core/util/string_utils.dart';

abstract class AppRoute {
  String get routeName;

  /// Path that should be provided as go_router base routes
  /// Equal to routeName
  String get goRouterPath => routeName;

  /// Path that should be provided as go_router shell routes
  /// Produced by removing leading first path component
  String get goRouterShellPath => routeName.byRemovingFirstPathComponent;

  Object? get arguments => null;
}
