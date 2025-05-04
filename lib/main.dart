import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'gen/assets.gen.dart';
import 'src/app/di/di.dart';
import 'src/app/game_app.dart';

Future<void> main() async {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  WidgetsFlutterBinding.ensureInitialized();
  await setupDi(navigatorKey);
  await Firebase.initializeApp();
  await precacheImages();
  runApp(
    GameApp(navigatorKey: navigatorKey),
  );
}

Future<void> precacheImages() async {
  final loader = SvgAssetLoader(Assets.images.handDrawnZoomEffectBackground.path);
  await svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
}
