part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherEntity weatherEntity;
  WeatherSuccess({required this.weatherEntity});
}

final class WeatherFailure extends WeatherState {
  final Failure failure;
  WeatherFailure({required this.failure});
}
