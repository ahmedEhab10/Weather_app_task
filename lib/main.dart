import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weather_app/Core/Routes_Manager/routes.dart';
import 'package:weather_app/Core/Routes_Manager/routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        onGenerateRoute: RoutesManager.onGenerateRoute,
        initialRoute: Routes.splash,
      ),
    );
  }
}
