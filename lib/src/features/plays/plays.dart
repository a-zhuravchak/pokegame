import 'package:flutter/foundation.dart';

import '../../core/domain/routing/entity/app_route.dart';

sealed class PlaysRoute extends AppRoute {}

final class PlaysInitialRoute extends PlaysRoute {
  @override
  String get routeName => '/plays';
}

final class PlaysKeys {
  static const Key plays = Key('plays');
}
