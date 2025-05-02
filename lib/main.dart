import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokegame/src/app/di/di.dart';
import 'package:pokegame/src/app/game_app.dart';

Future<void> main() async {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  WidgetsFlutterBinding.ensureInitialized();
  await setupDi(navigatorKey);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GameApp(navigatorKey: navigatorKey),
  );
}
