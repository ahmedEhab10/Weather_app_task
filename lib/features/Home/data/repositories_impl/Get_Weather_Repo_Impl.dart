import 'package:dartz/dartz.dart';
import 'package:weather_app/Core/Errors/failure.dart';
import 'package:weather_app/features/Home/data/data_source/Remote/Weather_remote_data_source.dart';
import 'package:weather_app/features/Home/domain/Entity/Weather_Entity.dart';
import 'package:weather_app/features/Home/domain/repositories/Get_Weather_Repo.dart';

class GetWeatherRepoImpl extends GetWeatherRepo {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  GetWeatherRepoImpl({required this.weatherRemoteDataSource});
  @override
  Future<Either<Failure, WeatherEntity>> getWeather({
    required String cityName,
  }) async {
    try {
      final response = await weatherRemoteDataSource.getWeatherData(
        cityName: cityName,
      );
      return Right(response.toEntity());
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
