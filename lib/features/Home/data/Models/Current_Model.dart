import 'package:weather_app/features/Home/data/Models/Condition_Model.dart';

class CurrentModel {
  final double tempC;
  final double tempF;
  final int isDay;

  final ConditionModel condition;

  final double windKph;
  final String windDir;

  final int humidity;

  final double feelsLikeC;

  final double uv;

  final int chanceOfRain;

  const CurrentModel({
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.windDir,
    required this.humidity,
    required this.feelsLikeC,
    required this.uv,
    required this.chanceOfRain,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      isDay: json['is_day'],
      condition: ConditionModel.fromJson(json['condition']),
      windKph: (json['wind_kph'] as num).toDouble(),
      windDir: json['wind_dir'],
      humidity: json['humidity'],
      feelsLikeC: (json['feelslike_c'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
      chanceOfRain: json['chance_of_rain'],
    );
  }
}
