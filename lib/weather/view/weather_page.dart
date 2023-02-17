import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_bloc/weather/widgets/weather_error.dart';
import 'package:weather_flutter_bloc/weather/widgets/weather_loading.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:weather_flutter_bloc/weather/cubit/weather_cubit.dart';
import '../widgets/weather_populated.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(context.read<WeatherRepository>()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/after_noon.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: BlocConsumer<WeatherCubit, WeatherState>(
            listener: (context, state) {
              if (state.status.isSuccess) {
                // context.read<ThemeCubit>().updateTheme(state.weather);
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case WeatherStatus.initial:
                case WeatherStatus.loading:
                  return const WeatherLoading();
                case WeatherStatus.success:
                  return WeatherPopulated(
                    weather: state.weatherModel,
                    onRefresh: () {
                      return context.read<WeatherCubit>().fetchWeather('/41.3874,2.1686');
                    },
                  );
                case WeatherStatus.failure:
                  return const WeatherError();
              }
            },
          ),
        ),
      ),
    );
  }
}