import 'package:flutter/material.dart';
import 'package:test_weather/core/models/dialy_weather.dart';
import 'package:test_weather/core/models/weather_model.dart';
import 'package:test_weather/core/utils/context_utils.dart';
import 'package:test_weather/core/widgets/function/weather_icon.dart';

import '../../../../constants/app_colors.dart';
import '../../picture_widgets/weather_image.dart';
import '../../rich_text_widgets/rich_text_widget.dart';
import '../../text_widgets/text_widget.dart';

class LocationsWidget extends StatefulWidget {
  final WeatherModel weather;

  const LocationsWidget({
    super.key,
    required this.weather,
  });

  @override
  State<LocationsWidget> createState() => _LocationsWidgetState();
}

class _LocationsWidgetState extends State<LocationsWidget> {
  String getWeatherDescription(int code) {
    if (code == 0) {
      return 'Clear sky';
    } else if ([1, 2, 3].contains(code)) {
      return 'Mainly clear';
    } else if ([45, 48].contains(code)) {
      return 'Fog';
    } else if ([51, 53, 55].contains(code)) {
      return 'Drizzle';
    } else if ([56, 57].contains(code)) {
      return 'Freezing Drizzle';
    } else if ([61, 63, 65].contains(code)) {
      return 'Rain';
    } else if ([66, 67].contains(code)) {
      return 'Freezing Rain';
    } else if ([71, 73, 75].contains(code)) {
      return 'Snow fall';
    } else if (code == 77) {
      return 'Snow grains';
    } else if ([80, 81, 82].contains(code)) {
      return 'Rain';
    } else if ([85, 86].contains(code)) {
      return 'Snow';
    } else if (code == 95) {
      return 'Thunderstorm';
    } else if ([96, 99].contains(code)) {
      return 'Thunderstorm';
    } else {
      return 'Unknown weather code';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final Daily item = widget.weather.daily;
    return Center(
      child: SizedBox(
        width: size.width * 0.85,
        height: size.height * 0.2,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Color.fromARGB(135, 192, 192, 192),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: widget.weather.regionName,
                          textStyle: context.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                            shadows: [
                              const BoxShadow(
                                color: Color.fromARGB(255, 82, 82, 82),
                                blurRadius: 10,
                                spreadRadius: 50,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                        ),
                        TextWidget(
                          text: getWeatherDescription(
                            item.weatherCode[0],
                          ),
                          textStyle: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichTextWidget(
                          boldText:
                              '${item.precipitationProbabilityMean[1].toString()}%',
                          text: "Humidity",
                        ),
                        RichTextWidget(
                          boldText: "${item.windSpeed10mMax[0].toString()}km/h",
                          text: "Wind",
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    WeatherImage(
                      size: size.width * 0.2,
                      image: getWeatherIcon(
                        item.weatherCode[0],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: item.temperature2MMax[0].floor().toString(),
                          textStyle: context.textTheme.displayLarge?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextWidget(
                          text: "℃",
                          textStyle: context.textTheme.headlineLarge?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
