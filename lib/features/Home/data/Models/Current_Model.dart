import 'package:weather_app/features/Home/data/Models/Condition_Model.dart';

class CurrentModel {
  final double tempC;
  final double tempF;
  final int isDay;

  final ConditionModel condition;

  final double windKph;
  final String windDir;

  final int humidity;
  final String last_updated;
  final num cloud;

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
    required this.cloud,
    required this.last_updated,
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
      cloud: json['cloud'],
      last_updated: json['last_updated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp_c': tempC,
      'temp_f': tempF,
      'is_day': isDay,
      'condition': condition.toJson(),
      'wind_kph': windKph,
      'wind_dir': windDir,
      'humidity': humidity,
      'feelslike_c': feelsLikeC,
      'uv': uv,
      'chance_of_rain': chanceOfRain,
      'cloud': cloud,
      'last_updated': last_updated,
    };
  }
}
