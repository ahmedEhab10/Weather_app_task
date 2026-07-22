import 'dart:ui';

import 'package:flutter/material.dart';

abstract class ColorsManager {
  static const Color primary = Color(0xff0057C2);
  static const Color secondary = Color(0xff000000);

  static const Color secondarytext = Color(0xff434655);

  //========================
  // Light Theme
  //========================

  static const lightBackground = Color(0xffF8FAFC);
  static const lightSurface = Colors.white;

  static const lightCard = Colors.white;

  static const lightBorder = Color(0xffE5E7EB);

  static const lightHint = Color(0xff94A3B8);

  static const lightText = Color(0xff0F172A);

  static const lightSubtitle = Color(0xff64748B);

  //========================
  // Dark Theme
  //========================

  static const darkBackground = Color(0xff0F172A);

  static const darkSurface = Color(0xff172033);

  static const darkCard = Color(0xff1E293B);

  static const darkBorder = Color(0xff334155);

  static const darkHint = Color(0xff94A3B8);

  static const darkText = Colors.white;

  static const darkSubtitle = Color(0xffCBD5E1);

  //========================
  // Weather
  //========================

  static const success = Color(0xff22C55E);

  static const warning = Color(0xffF59E0B);

  static const danger = Color(0xffEF4444);

  static const info = Color(0xff38BDF8);
}
