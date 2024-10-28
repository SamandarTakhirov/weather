import 'package:flutter/material.dart';
import 'package:test_weather/constants/app_colors.dart';
import 'package:test_weather/core/models/weather_model.dart';
import 'package:test_weather/core/utils/context_utils.dart';
import 'package:test_weather/core/widgets/function/weather_icon.dart';

class WeatherDialy extends StatelessWidget {
  final WeatherModel model;
  final int element;
  const WeatherDialy({
    required this.model,
    required this.element,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final daysOfWeek = {
      1: 'Mon',
      2: 'Tue',
      3: 'Wed',
      4: 'Thu',
      5: 'Fri',
      6: 'Sat',
      7: 'Sun',
    };

    final time = DateTime.tryParse(model.daily.time[element]);
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${daysOfWeek[time?.weekday]} ${time?.day}",
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Image(
          width: size.width * 0.13,
          height: size.width * 0.13,
          image: AssetImage(getWeatherIcon(model.daily.weatherCode[element])),
        ),
        Text(
          "${model.daily.temperature2MMax[element].floor().toString()}º",
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "${model.daily.windSpeed10mMax[element]}",
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.white,
          ),
        ),
        Text(
          "km/h",
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
