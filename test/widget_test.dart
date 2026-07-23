// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Core/resources/Theme_Provider.dart';
import 'package:weather_app/main.dart';

void main() {
  setUp(() async {
    // Initialize Hive for tests
    Hive.init('test_hive_dir');
    await Hive.openBox('weather_box');
  });

  tearDown(() async {
    await Hive.close();
    try {
      final dir = Directory('test_hive_dir');
      if (await dir.exists()) {
        await dir.delete(recursive: true);
      }
    } catch (_) {}
  });

  testWidgets('App launches and displays Weatherly', (WidgetTester tester) async {
    // Build our app wrapped with the required ChangeNotifierProvider.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const MyApp(),
      ),
    );

    // Verify that the splash screen text is shown.
    expect(find.text('Weatherly'), findsOneWidget);

    // Let the splash screen timer run out
    await tester.pump(const Duration(seconds: 4));
  });
}
