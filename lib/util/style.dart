import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class Style {
  static const PageTransitionsTheme _pageTransitionsTheme = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  static final ThemeData light = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: lightPrimaryColor,
      secondary: lightAccentColor,
      brightness: Brightness.light,
    ),
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: GoogleFonts.rubikTextTheme(ThemeData.light().textTheme),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: darkAccentColor,
      brightness: Brightness.dark,
    ),
    canvasColor: darkCanvasColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    cardColor: darkCardColor,
    dividerColor: darkDividerColor,
    dialogBackgroundColor: darkCardColor,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: GoogleFonts.rubikTextTheme(ThemeData.dark().textTheme),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );

  static final ThemeData black = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: blackPrimaryColor,
      secondary: blackAccentColor,
      brightness: Brightness.dark,
    ),
    canvasColor: blackPrimaryColor,
    scaffoldBackgroundColor: blackPrimaryColor,
    cardColor: blackPrimaryColor,
    dividerColor: darkDividerColor,
    dialogBackgroundColor: darkCardColor,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: GoogleFonts.rubikTextTheme(ThemeData.dark().textTheme),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: const BorderSide(color: darkDividerColor),
      ),
    ),
  );
}
