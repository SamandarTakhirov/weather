import 'package:flutter/material.dart';
import 'package:test_weather/core/models/weather_model.dart';
import 'package:test_weather/core/widgets/function/weather_icon.dart';

Widget buildOneDay(WeatherModel model, int i) {
  final daysOfWeek = {
    1: 'Mon',
    2: 'Tue',
    3: 'Wed',
    4: 'Thu',
    5: 'Fri',
    6: 'Sat',
    7: 'Sun',
  };

  final time = DateTime.tryParse(model.daily.time[i]);
  return Column(
    children: [
      Text(
        "${daysOfWeek[time?.weekday]} ${time?.day}",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 20),
      Image.asset(
        getWeatherIcon(model.daily.weatherCode[i]),
        width: 50,
        height: 50,
      ),
      const SizedBox(height: 8),
      Text(
        '${model.daily.temperature2MMax[i].floor().toString()}º',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 16),
      Text(
        '${model.daily.windSpeed10mMax[i]}\nkm/h',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
