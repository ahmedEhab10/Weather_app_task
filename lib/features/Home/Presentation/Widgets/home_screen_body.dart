import 'package:flutter/material.dart';
import 'package:weather_app/features/Home/Presentation/Widgets/information_continar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: const Column(children: [InformationContinar()]),
      ),
    );
  }
}
