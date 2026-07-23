import 'package:hive/hive.dart';
import 'package:weather_app/features/Home/data/Models/Weather_Model.dart';

abstract class WeatherLocalDataSource {
  Future<void> saveWeather(WeatherModel weather);
  Future<List<WeatherModel>> getRecentWeather();
}

class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  final Box _box;

  WeatherLocalDataSourceImpl({required Box box}) : _box = box;

  @override
  Future<void> saveWeather(WeatherModel weather) async {
    final list = _box.get('recent_weather', defaultValue: []) as List;
    final List<Map<String, dynamic>> maps = list
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();

    // Remove matching item to move it to the top (case insensitive)
    maps.removeWhere((item) {
      final itemLocation = item['location'];
      if (itemLocation == null) return true;
      final cityName = itemLocation['name'];
      return cityName.toString().toLowerCase() == weather.location.name.toLowerCase();
    });

    // Insert at front
    maps.insert(0, weather.toJson());

    // Limit to 3 items
    if (maps.length > 3) {
      maps.removeRange(3, maps.length);
    }

    await _box.put('recent_weather', maps);
  }

  @override
  Future<List<WeatherModel>> getRecentWeather() async {
    final list = _box.get('recent_weather', defaultValue: []) as List;
    return list
        .map((e) => WeatherModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }
}
