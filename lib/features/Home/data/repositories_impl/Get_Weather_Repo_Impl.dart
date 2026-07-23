import 'package:dartz/dartz.dart';
import 'package:weather_app/Core/Errors/failure.dart';
import 'package:weather_app/features/Home/data/data_source/Local/Weather_local_data_source.dart';
import 'package:weather_app/features/Home/data/data_source/Remote/Weather_remote_data_source.dart';
import 'package:weather_app/features/Home/domain/Entity/Weather_Entity.dart';
import 'package:weather_app/features/Home/domain/repositories/Get_Weather_Repo.dart';

class GetWeatherRepoImpl extends GetWeatherRepo {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  final WeatherLocalDataSource weatherLocalDataSource;

  GetWeatherRepoImpl({
    required this.weatherRemoteDataSource,
    required this.weatherLocalDataSource,
  });

  @override
  Future<Either<Failure, WeatherEntity>> getWeather({
    required String cityName,
  }) async {
    try {
      final response = await weatherRemoteDataSource.getWeatherData(
        cityName: cityName,
      );
      await weatherLocalDataSource.saveWeather(response);
      return Right(response.toEntity());
    } on Failure catch (failure) {
      try {
        final recentList = await weatherLocalDataSource.getRecentWeather();
        final cached = recentList.firstWhere(
          (element) => element.location.name.toLowerCase() == cityName.toLowerCase(),
        );
        return Right(cached.toEntity());
      } catch (_) {
        return Left(failure);
      }
    } catch (e) {
      try {
        final recentList = await weatherLocalDataSource.getRecentWeather();
        final cached = recentList.firstWhere(
          (element) => element.location.name.toLowerCase() == cityName.toLowerCase(),
        );
        return Right(cached.toEntity());
      } catch (_) {
        return Left(UnknownFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<WeatherEntity>>> getRecentSearches() async {
    try {
      final list = await weatherLocalDataSource.getRecentWeather();
      final entities = list.map((e) => e.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
