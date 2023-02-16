import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(const WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> fetchWeather(String? city) async {
    if (city == null || city.isEmpty) return;

    // emit(
    //   state.copyWith(
    //     status: WeatherStatus.loading,
    //   ),
    // );

    try {
      final weatherModel = await _weatherRepository.getWeather(city);

      final newWeatherModel = WeatherModel(
        dailyList: weatherModel.dailyList,
        hourlyList: weatherModel.hourlyList,
        weatherType: weatherModel.weatherType,
        currentCityTemp: weatherModel.currentCityTemp,
        currentDate: weatherModel.currentDate,
        cityName: weatherModel.cityName,
      );

      emit(
        state.copyWith(
          status: WeatherStatus.success,
          weatherModel: newWeatherModel,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(WeatherState state) {
    return null;
  }
}
