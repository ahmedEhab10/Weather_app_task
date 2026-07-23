import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Core/Models/Statistics_continar_model.dart';
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
    return BlocListener<WeatherCubit, WeatherState>(
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
      child: Stack(
        children: [
          SingleChildScrollView(
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

                  BlocBuilder<WeatherCubit, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherSuccess) {
                        return InformationContinar(
                          weatherEntity: state.weatherEntity,
                        );
                      }

                      return Container();
                    },
                  ),

                  const SizedBox(height: 22),

                  BlocBuilder<WeatherCubit, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherSuccess) {
                        final weather = state.weatherEntity;

                        return GridView(
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
                              value: '${weather.humidity}',
                            ),
                            StatConainer(
                              statisticsContinarModel: StatisticsContinarModel(
                                name: "Wind",
                                icon: "assets/Svg/Wind.svg",

                                prsentpercentage: false,
                              ),
                              value: '${weather.windKph}kph',
                            ),
                            StatConainer(
                              statisticsContinarModel: StatisticsContinarModel(
                                name: "Chance of Rain",
                                icon: "assets/Svg/CloudCover.svg",

                                prsentpercentage: true,
                              ),
                              value: '${weather.cloud}',
                            ),
                            StatConainer(
                              statisticsContinarModel: StatisticsContinarModel(
                                name: "UV Index",
                                icon: "assets/Svg/UV Index.svg",

                                prsentpercentage: false,
                              ),
                              value: '${weather.uv}',
                            ),
                          ],
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),

          BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is! WeatherLoading) {
                return const SizedBox();
              }

              return Positioned.fill(
                child: Container(
                  color: Colors.black26,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
