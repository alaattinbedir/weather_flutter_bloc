import 'package:base_api/base_api.dart';
import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  const WeatherModel({
    required this.dailyList,
    required this.hourlyList,
    required this.weatherType,
    required this.currentCityTemp,
    required this.currentDate,
    required this.cityName,
  });

  final List<Datum> dailyList;
  final List<Currently> hourlyList;
  final String weatherType;
  final double currentCityTemp;
  final int currentDate;
  final String cityName;

  WeatherModel copyWith({
    required List<Datum> dailyList,
    required List<Currently> hourlyList,
    required String weatherType,
    required double currentCityTemp,
    required int currentDate,
    required String cityName,
  }) {
    return WeatherModel(
      dailyList: dailyList,
      hourlyList: hourlyList,
      weatherType: weatherType,
      currentCityTemp: currentCityTemp,
      currentDate: currentDate,
      cityName: cityName,
    );
  }

  @override
  List<Object?> get props => [dailyList, hourlyList, weatherType, currentCityTemp, currentDate, cityName];
}
