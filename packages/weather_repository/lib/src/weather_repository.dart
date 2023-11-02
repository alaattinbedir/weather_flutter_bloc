import 'dart:async';
import 'package:base_api/base_api.dart';
import '../weather_repository.dart';

class WeatherRepository {
  WeatherRepository({BaseApiClient? weatherApiClient}) : _weatherApiClient = weatherApiClient ?? BaseApiClient();
  final BaseApiClient _weatherApiClient;

  Future<WeatherModel> getWeather(String cityCoordinates) async {
    final response = await _weatherApiClient.get(cityCoordinates, contentType: MimeType.applicationJson.name);

    final weather = weatherFromJson(response);

    return WeatherModel(
        dailyList: weather.daily,
        hourlyList: weather.hourly,
        weatherType: weather.current.weather[0].description.name,
        currentCityTemp: weather.current.temp,
        currentDate: weather.current.dt,
        cityName: 'Barcelona');
  }
}
