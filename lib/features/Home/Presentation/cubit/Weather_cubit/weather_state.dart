part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {
  final List<WeatherEntity> recentSearches;
  const WeatherState({this.recentSearches = const []});
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial({super.recentSearches});
}

final class WeatherLoading extends WeatherState {
  const WeatherLoading({super.recentSearches});
}

final class WeatherSuccess extends WeatherState {
  final WeatherEntity weatherEntity;
  const WeatherSuccess({required this.weatherEntity, super.recentSearches});
}

final class WeatherFailure extends WeatherState {
  final Failure failure;
  const WeatherFailure({required this.failure, super.recentSearches});
}
