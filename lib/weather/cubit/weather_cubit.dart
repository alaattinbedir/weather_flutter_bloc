import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_flutter_bloc/app/helper/exception_handlers.dart';
import 'package:weather_repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(const WeatherState(errorMessage: ''));

  final WeatherRepository _weatherRepository;

  Future<void> fetchWeather(String? city) async {
    if (city == null || city.isEmpty) return;

    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weatherModel = await _weatherRepository.getWeather(city);

      emit(
        state.copyWith(
          status: WeatherStatus.success,
          weatherModel: weatherModel,
        ),
      );
    } catch (e) {
      var errorMessage = ExceptionHandlers().getExceptionString(e);
      emit(state.copyWith(status: WeatherStatus.failure, errorMessage: errorMessage));
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
