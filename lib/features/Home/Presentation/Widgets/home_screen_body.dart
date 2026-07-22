import 'package:flutter/material.dart';
import 'package:weather_app/Core/Models/Statistics_continar_model.dart';
import 'package:weather_app/features/Home/Presentation/Widgets/Search_Text_Field.dart';
import 'package:weather_app/features/Home/Presentation/Widgets/information_continar.dart';
import 'package:weather_app/features/Home/Presentation/Widgets/statistics_conainer.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          children: [
            AppSearchTextField(controller: null, onChanged: (String value) {}),
            const SizedBox(height: 16),
            InformationContinar(),
            SizedBox(height: 22),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.7,
              ),
              children: [
                StatConainer(
                  statisticsContinarModel: StatisticsContinarModel(
                    name: "Humidity",
                    icon: "assets/Svg/Humidty.svg",
                    count: 60,
                    prsentpercentage: true,
                  ),
                ),
                StatConainer(
                  statisticsContinarModel: StatisticsContinarModel(
                    name: "Wind",
                    icon: "assets/Svg/Wind.svg",
                    count: 0,
                    prsentpercentage: false,
                  ),
                ),
                StatConainer(
                  statisticsContinarModel: StatisticsContinarModel(
                    name: "Cloud Cover",
                    icon: "assets/Svg/CloudCover.svg",
                    count: 0,
                    prsentpercentage: true,
                  ),
                ),
                StatConainer(
                  statisticsContinarModel: StatisticsContinarModel(
                    name: "UV Index",
                    icon: "assets/Svg/UV Index.svg",
                    count: 0,
                    prsentpercentage: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
