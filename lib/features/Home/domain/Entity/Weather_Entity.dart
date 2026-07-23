class WeatherEntity {
  final String cityName;
  final String region;
  final String country;
  final String localTime;

  final double tempC;
  final double tempF;

  final bool isDay;

  final String condition;
  final String conditionIcon;

  final double windKph;
  final String windDirection;

  final int humidity;
  final num cloud;
  final double feelsLikeC;
  final String last_updated;
  final double uv;

  final int chanceOfRain;

  const WeatherEntity({
    required this.cityName,
    required this.region,
    required this.country,
    required this.localTime,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.conditionIcon,
    required this.windKph,
    required this.windDirection,
    required this.humidity,
    required this.feelsLikeC,
    required this.uv,
    required this.chanceOfRain,
    required this.cloud,
    required this.last_updated,
  });
}
