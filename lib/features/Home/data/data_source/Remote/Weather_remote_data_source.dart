import 'package:weather_app/features/Home/data/Models/Weather_Model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherData({required String cityName});
}
