import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
  BuildContext context, {
  String bodyFontString = 'Manrope',
  String displayFontString = 'Manrope',
}) {
  TextTheme baseTextTheme = GoogleFonts.manropeTextTheme();
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme = GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    headlineLarge: bodyTextTheme.headlineLarge,
    headlineMedium: bodyTextTheme.headlineMedium,
    headlineSmall: bodyTextTheme.headlineSmall,
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}

TextStyle bubbleTextStyle(ColorScheme cs) {
  return GoogleFonts.pacifico(
    textStyle: TextStyle(
      color: cs.secondaryContainer,
      fontSize: 32,
      fontWeight: FontWeight.w400,
    ),
  );
}
