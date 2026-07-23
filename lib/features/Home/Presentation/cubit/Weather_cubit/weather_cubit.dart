import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/Core/Errors/failure.dart';
import 'package:weather_app/features/Home/domain/Entity/Weather_Entity.dart';
import 'package:weather_app/features/Home/domain/repositories/Get_Weather_Repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherRepo getWeatherRepo;
  WeatherCubit({required this.getWeatherRepo}) : super(const WeatherInitial()) {
    getRecentSearches();
  }

  Future<void> getRecentSearches() async {
    final result = await getWeatherRepo.getRecentSearches();
    result.fold(
      (failure) => null,
      (recent) {
        final current = state;
        if (current is WeatherSuccess) {
          emit(WeatherSuccess(
            weatherEntity: current.weatherEntity,
            recentSearches: recent,
          ));
        } else if (current is WeatherLoading) {
          emit(WeatherLoading(recentSearches: recent));
        } else if (current is WeatherFailure) {
          emit(WeatherFailure(
            failure: current.failure,
            recentSearches: recent,
          ));
        } else {
          emit(WeatherInitial(recentSearches: recent));
        }
      },
    );
  }

  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoading(recentSearches: state.recentSearches));
    final result = await getWeatherRepo.getWeather(cityName: cityName);
    
    final recentResult = await getWeatherRepo.getRecentSearches();
    final recentList = recentResult.fold((_) => state.recentSearches, (recent) => recent);

    result.fold(
      (failure) => emit(WeatherFailure(failure: failure, recentSearches: recentList)),
      (weather) => emit(WeatherSuccess(weatherEntity: weather, recentSearches: recentList)),
    );
  }
}
