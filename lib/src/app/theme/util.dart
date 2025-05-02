import 'package:pokegame/src/app/theme/text_theme.dart';
import 'package:pokegame/src/app/theme/theme.dart';
import 'package:flutter/material.dart';

ThemeData createAppTheme(BuildContext context) {
  final brightness = View.of(context).platformDispatcher.platformBrightness;
  final TextTheme textTheme = createTextTheme(context);
  final MaterialTheme materialTheme = MaterialTheme(textTheme);

  return brightness == Brightness.light ? materialTheme.light() : materialTheme.dark();
}
