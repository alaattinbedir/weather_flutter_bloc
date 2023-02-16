import 'dart:async';
import 'package:base_api/base_api.dart';
import 'package:weather_repository/src/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository({BaseApiClient? weatherApiClient}) : _weatherApiClient = weatherApiClient ?? BaseApiClient();
  final BaseApiClient _weatherApiClient;

  Future<WeatherModel> getWeather(String cityCoordinates) async {
    final response = await _weatherApiClient.get(cityCoordinates, contentType: MimeType.applicationJson.name);

    final weather = weatherFromJson(response);

    return WeatherModel(
        dailyList: weather.daily.data,
        hourlyList: weather.hourly.data,
        weatherType: weather.currently.summary == null ? 'Clear' : weather.currently.summary.toString(),
        currentCityTemp: weather.currently.temperature,
        currentDate: weather.currently.time,
        cityName: 'Barcelona');
  }
}
