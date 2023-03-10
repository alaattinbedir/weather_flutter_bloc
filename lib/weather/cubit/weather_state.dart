// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

class WeatherState extends Equatable {
  const WeatherState({
    this.status = WeatherStatus.initial,
    WeatherModel? weatherModel,
    required String errorMessage,
  }) : weatherModel =
            weatherModel ?? const WeatherModel(cityName: '', currentCityTemp: 0, currentDate: 0, dailyList: [], hourlyList: [], weatherType: '');

  final WeatherStatus status;
  final WeatherModel weatherModel;
  final String errorMessage = '';

  @override
  List<Object> get props => [status, weatherModel, errorMessage];

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherModel? weatherModel,
    String? errorMessage,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weatherModel: weatherModel ?? this.weatherModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
