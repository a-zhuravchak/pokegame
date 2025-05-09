import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'di_firebase.dart' as firebase;
import 'di_pokeapi.dart' as pokeapi;
import 'di_routing.dart' as routing;
import 'di_startup.dart' as startup;

final getIt = GetIt.asNewInstance();

Future<void> setupDi(GlobalKey<NavigatorState> navigatorKey) async {
  await startup.setup(getIt);
  routing.setup(getIt);
  pokeapi.setup(getIt);
  firebase.setup(getIt);
}
