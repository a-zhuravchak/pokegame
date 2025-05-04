import 'package:flutter/material.dart';

import 'text_theme.dart';
import 'theme.dart';

ThemeData createAppTheme(BuildContext context) {
  final brightness = View.of(context).platformDispatcher.platformBrightness;
  final textTheme = createTextTheme(context);
  final materialTheme = MaterialTheme(textTheme);

  return brightness == Brightness.light ? materialTheme.light() : materialTheme.dark();
}
