import 'package:flutter/material.dart';
import 'package:weather_repository/weather_repository.dart';

import '../../app/helper/utility.dart';

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({
    super.key,
    required this.weather,
    required this.onRefresh,
  });

  final WeatherModel weather;

  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _WeatherBackground(),
        RefreshIndicator(
          onRefresh: onRefresh,
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  weather.cityName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                  width: double.infinity,
                ),
                Text(
                  weather.weatherType,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Image.asset(
                  'assets/images/partly_sunny.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  Utility().convertFahrenheitToCelsiusAsString(weather.currentCityTemp),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 65.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  Utility().getFormatedDate(weather.currentDate),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: 18,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 5,
                      );
                    },
                    itemBuilder: (context, index) {
                      return buildHorlyCell(index);
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDailyCell(index);
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildHorlyCell(int index) => Container(
      color: Colors.transparent,
      width: 55,
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Utility().getHourFromDate(1231231),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Image.asset(
            'assets/images/partly_sunny.png',
            width: 40,
            height: 30,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            Utility().convertFahrenheitToCelsiusAsString(233),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );

Widget buildDailyCell(int index) => Container(
      color: Colors.transparent,
      height: 55,
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 90,
            child: Text(
              Utility().getDayFromDate(232323324324),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/images/partly_sunny.png',
            width: 40,
            height: 30,
            fit: BoxFit.fitWidth,
          ),
          const Spacer(),
          Text(
            Utility().convertFahrenheitToCelsiusAsString(232),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            Utility().convertFahrenheitToCelsiusAsString(232),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );

class _WeatherBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SizedBox.expand(
      child: const DecoratedBox(
          decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/after_noon.png"),
          fit: BoxFit.cover,
        ),
      )),
    );
  }
}
