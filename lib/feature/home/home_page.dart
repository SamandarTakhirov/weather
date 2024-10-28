import "dart:ui";
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:formz/formz.dart";
import "package:test_weather/constants/app_icons.dart";
import "package:test_weather/core/models/dialy_weather.dart";
import "package:test_weather/core/utils/context_utils.dart";
import "package:test_weather/feature/drower/drower_page.dart";
import "package:test_weather/feature/main/main_bloc.dart";
import "../../constants/app_colors.dart";
import "../../core/widgets/function/weather_icon.dart";
import "../../core/widgets/picture_widgets/svg_widget.dart";
import "../../core/widgets/picture_widgets/weather_image.dart";
import "../../core/widgets/text_widgets/text_widget.dart";
import "../../core/widgets/weather_dialy/weather_dialy.dart";
import "../../core/widgets/weather_info/weather_info.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  String formatDate(String dateStr) {
    final monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    DateTime now = DateTime.now();
    return '${monthNames[now.month - 1]} ${now.day}';
  }

  String formatUpdate(String dateStr) {
    DateTime now = DateTime.now();
    return 'Updated as of ${now.day}/${now.month}/${now.year} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        final Daily weather = state.weatherModel.daily;
        return state.status.isInitial || state.status.isInProgress
            ? const SizedBox()
            : Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(state.weatherModel.imagePath),
                        colorFilter: const ColorFilter.mode(
                          Color.fromARGB(28, 0, 0, 0),
                          BlendMode.darken,
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      leadingWidth: size.width * 0.1,
                      leading: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.05),
                        child: SvgWidget(
                          image: AppIcons.location,
                          size: 10,
                        ),
                      ),
                      title: TextWidget(
                        text: state.weatherModel.regionName,
                        textStyle: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                      actions: [
                        Builder(builder: (context) {
                          return IconButton(
                            onPressed: () =>
                                Scaffold.of(context).openEndDrawer(),
                            icon: SvgWidget(
                              image: AppIcons.menu,
                            ),
                          );
                        }),
                      ],
                    ),
                    endDrawer: Drawer(
                      width: size.width,
                      child: const DrowerPage(),
                    ),
                    body: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                TextWidget(
                                  text: formatDate(weather.time[0]),
                                  textStyle:
                                      context.textTheme.headlineLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                                TextWidget(
                                  text: formatUpdate(weather.time[0]),
                                  textStyle:
                                      context.textTheme.titleMedium?.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                WeatherImage(
                                  image: getWeatherIcon(weather.weatherCode[0]),
                                ),
                                TextWidget(
                                  text: getWeatherDescription(
                                      weather.weatherCode[0]),
                                  textStyle:
                                      context.textTheme.displayLarge?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                      text:
                                          (weather.temperature2MMax[0].floor())
                                              .toString(),
                                      textStyle: context.textTheme.displayLarge
                                          ?.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextWidget(
                                      text: "℃",
                                      textStyle: context.textTheme.headlineLarge
                                          ?.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              WeatherInfo(
                                image: AppIcons.humidity,
                                text: "HUMIDITY",
                                textInfo:
                                    '${weather.precipitationProbabilityMean[1].toString()}%',
                              ),
                              WeatherInfo(
                                image: AppIcons.windy,
                                text: "WIND",
                                textInfo:
                                    "${weather.windSpeed10mMax[0].toString()}km/h",
                              ),
                              WeatherInfo(
                                image: AppIcons.hot,
                                text: "FEELS LIKE",
                                textInfo:
                                    "${weather.apparentTemperatureMax[0].toString()}°",
                              ),
                            ],
                          ),
                          Center(
                            child: SizedBox(
                              width: size.width * 0.85,
                              height: size.height * 0.2,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 10,
                                  ),
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: size.width * 0.04,
                                    ),
                                    itemBuilder: (context, index) {
                                      return WeatherDialy(
                                        model: state.weatherModel,
                                        element: index + 1,
                                      );
                                    },
                                    itemCount: 6,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
