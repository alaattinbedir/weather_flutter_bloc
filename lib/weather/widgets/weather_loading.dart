import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_bloc/weather/cubit/weather_cubit.dart';

class WeatherLoading extends StatefulWidget {
  const WeatherLoading({super.key});

  @override
  State<WeatherLoading> createState() => _WeatherLoadingState();
}

class _WeatherLoadingState extends State<WeatherLoading> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().fetchWeather('/41.3874,2.1686');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
