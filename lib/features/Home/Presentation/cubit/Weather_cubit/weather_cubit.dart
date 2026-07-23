import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/Core/Errors/failure.dart';
import 'package:weather_app/features/Home/domain/Entity/Weather_Entity.dart';
import 'package:weather_app/features/Home/domain/repositories/Get_Weather_Repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  GetWeatherRepo getWeatherRepo;
  WeatherCubit({required this.getWeatherRepo}) : super(WeatherInitial());

  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoading());
    final result = await getWeatherRepo.getWeather(cityName: cityName);
    result.fold(
      (failure) => emit(WeatherFailure(failure: failure)),
      (weather) => emit(WeatherSuccess(weatherEntity: weather)),
    );
  }
}
