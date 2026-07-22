import 'package:weather_app/features/Home/data/Models/Current_Model.dart';
import 'package:weather_app/features/Home/data/Models/Location_Model.dart';

class WeatherModel {
  final LocationModel location;
  final CurrentModel current;

  const WeatherModel({required this.location, required this.current});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: LocationModel.fromJson(json['location']),
      current: CurrentModel.fromJson(json['current']),
    );
  }

  // WeatherEntity toEntity() {
  //   return WeatherEntity(
  //     cityName: location.name,
  //     region: location.region,
  //     country: location.country,
  //     localTime: location.localTime,
  //     tempC: current.tempC,
  //     tempF: current.tempF,
  //     isDay: current.isDay == 1,
  //     condition: current.condition.text,
  //     conditionIcon: "https:${current.condition.icon}",
  //     windKph: current.windKph,
  //     windDirection: current.windDir,
  //     humidity: current.humidity,
  //     feelsLikeC: current.feelsLikeC,
  //     uv: current.uv,
  //     chanceOfRain: current.chanceOfRain,
  //   );
  // }
}
