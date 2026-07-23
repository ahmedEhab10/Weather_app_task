import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Core/resources/Colors_Manager.dart';

class AppTheme {
  // ── Light ──────────────────────────────────────────────
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: ColorsManager.primary,
          surface: ColorsManager.lightSurface,
        ),
        scaffoldBackgroundColor: ColorsManager.lightBackground,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorsManager.lightBackground,
          elevation: 0,
          scrolledUnderElevation: 0,
          iconTheme: const IconThemeData(color: ColorsManager.lightText),
          titleTextStyle: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: ColorsManager.primary,
          ),
        ),
        cardColor: ColorsManager.lightCard,
        dividerColor: ColorsManager.lightBorder,
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: ColorsManager.lightText,
          displayColor: ColorsManager.lightText,
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),
      );

  // ── Dark ───────────────────────────────────────────────
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: ColorsManager.primary,
          surface: ColorsManager.darkSurface,
        ),
        scaffoldBackgroundColor: ColorsManager.darkBackground,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorsManager.darkBackground,
          elevation: 0,
          scrolledUnderElevation: 0,
          iconTheme: const IconThemeData(color: ColorsManager.darkText),
          titleTextStyle: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: ColorsManager.primary,
          ),
        ),
        cardColor: ColorsManager.darkCard,
        dividerColor: ColorsManager.darkBorder,
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: ColorsManager.darkText,
          displayColor: ColorsManager.darkText,
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),
      );
}
