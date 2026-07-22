import 'package:flutter/material.dart';
import 'package:weather_app/Core/Routes_Manager/routes.dart';
import 'package:weather_app/features/Splash/presentation/splash_screen.dart';

abstract class RoutesManager {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      default:
        return null;
    }
  }
}
