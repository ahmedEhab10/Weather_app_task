import 'package:dartz/dartz.dart';
import 'package:weather_app/Core/Errors/failure.dart';

import 'package:weather_app/features/Home/domain/Entity/Weather_Entity.dart';

abstract class GetWeatherRepo {
  Future<Either<Failure, WeatherEntity>> getWeather({required String cityName});
  Future<Either<Failure, List<WeatherEntity>>> getRecentSearches();
}
