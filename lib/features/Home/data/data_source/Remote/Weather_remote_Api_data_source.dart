import 'package:weather_app/Core/Const/Api_Constants.dart';
import 'package:weather_app/Core/Services/Api_Client.dart';
import 'package:weather_app/features/Home/data/Models/Weather_Model.dart';
import 'package:weather_app/features/Home/data/data_source/Remote/Weather_remote_data_source.dart';

class WeatherRemoteApiDataSource extends WeatherRemoteDataSource {
  final ApiClient apiClient;

  WeatherRemoteApiDataSource({required this.apiClient});
  @override
  Future<WeatherModel> getWeatherData({required String cityName}) async {
    final response = await apiClient.post(
      endPoint: ApiConstants.weatherEndPoint,
      queryParameters: {'key': ApiConstants.apiKey, 'q': cityName},
    );

    return WeatherModel.fromJson(response.data);
  }
}
