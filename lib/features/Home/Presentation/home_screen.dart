import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/Core/Const/Api_Constants.dart';
import 'package:weather_app/Core/Services/Api_Client.dart';
import 'package:weather_app/Core/resources/Colors_Manager.dart';
import 'package:weather_app/features/Home/Presentation/Widgets/home_screen_body.dart';
import 'package:weather_app/features/Home/Presentation/cubit/Weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/Home/data/data_source/Local/Weather_local_data_source.dart';
import 'package:weather_app/features/Home/data/data_source/Remote/Weather_remote_Api_data_source.dart';
import 'package:weather_app/features/Home/data/repositories_impl/Get_Weather_Repo_Impl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorsManager.lightBackground,
      appBar: AppBar(
        title: Text(
          'Weatherly',
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: ColorsManager.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        // dependency injection To implement the Dependency Inversion principle
        create: (context) => WeatherCubit(
          getWeatherRepo: GetWeatherRepoImpl(
            weatherRemoteDataSource: WeatherRemoteApiDataSource(
              apiClient: ApiClient(
                dio: Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)),
              ),
            ),
            weatherLocalDataSource: WeatherLocalDataSourceImpl(
              box: Hive.box('weather_box'),
            ),
          ),
        ),
        child: const HomeScreenBody(),
      ),
    );
  }
}
