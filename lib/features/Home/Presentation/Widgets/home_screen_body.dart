import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Core/Models/Statistics_continar_model.dart';
import 'package:weather_app/Core/resources/Colors_Manager.dart';
import 'package:weather_app/features/Home/Presentation/Widgets/Search_Text_Field.dart';
import 'package:weather_app/features/Home/Presentation/Widgets/information_continar.dart';
import 'package:weather_app/features/Home/Presentation/Widgets/statistics_conainer.dart';
import 'package:weather_app/features/Home/Presentation/cubit/Weather_cubit/weather_cubit.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchWeather() {
    final city = _searchController.text.trim();

    if (city.isEmpty) return;

    FocusScope.of(context).unfocus();

    context.read<WeatherCubit>().getWeather(cityName: city);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(state.failure.message),
              ),
            );
        }
      },

      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                AppSearchTextField(
                  controller: _searchController,
                  onChanged: (_) {},
                  onClear: () {
                    _searchController.clear();
                    setState(() {});
                  },
                  onSubmitted: (_) => _searchWeather(),
                ),

                const SizedBox(height: 16),

                if (state.recentSearches.isNotEmpty) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Recent Searches",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.recentSearches.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final item = state.recentSearches[index];
                        return GestureDetector(
                          onTap: () {
                            _searchController.text = item.cityName;
                            context.read<WeatherCubit>().getWeather(cityName: item.cityName);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: ColorsManager.lightBackground,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: ColorsManager.primary.withOpacity(0.2)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.history, size: 16, color: ColorsManager.primary),
                                const SizedBox(width: 6),
                                Text(
                                  "${item.cityName} (${item.tempC.round()}°C)",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: ColorsManager.secondarytext,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                if (state is WeatherLoading) ...[
                  Lottie.asset(
                    "assets/Animation/thunderstorms overcast-rain no result found.json",
                    height: 100,
                    width: 100,
                  ),
                ],
                if (state is WeatherSuccess) ...[
                  InformationContinar(weatherEntity: state.weatherEntity),

                  const SizedBox(height: 22),

                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                          prsentpercentage: true,
                        ),
                        value: '${state.weatherEntity.humidity}',
                      ),

                      StatConainer(
                        statisticsContinarModel: StatisticsContinarModel(
                          name: "Wind",
                          icon: "assets/Svg/Wind.svg",
                          prsentpercentage: false,
                        ),
                        value: '${state.weatherEntity.windKph} kph',
                      ),

                      StatConainer(
                        statisticsContinarModel: StatisticsContinarModel(
                          name: "Chance of Rain",
                          icon: "assets/Svg/CloudCover.svg",
                          prsentpercentage: true,
                        ),
                        value: '${state.weatherEntity.cloud}',
                      ),

                      StatConainer(
                        statisticsContinarModel: StatisticsContinarModel(
                          name: "UV Index",
                          icon: "assets/Svg/UV Index.svg",
                          prsentpercentage: false,
                        ),
                        value: '${state.weatherEntity.uv}',
                      ),
                    ],
                  ),
                ] else ...[
                  Center(
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/Animation/lets serch.json',
                          height: 300,
                        ),
                        Text(
                          "Search for a city",
                          style: GoogleFonts.irishGrover(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.warning,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
