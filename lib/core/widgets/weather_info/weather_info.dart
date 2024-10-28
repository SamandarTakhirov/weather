import 'package:flutter/material.dart';
import 'package:test_weather/constants/app_colors.dart';

class WeatherInfo extends StatelessWidget {
  final String image;
  final String text;
  final String textInfo;
  const WeatherInfo({
    required this.image,
    required this.textInfo,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          width: 45,
          height: 45,
          color: AppColors.white,
          image: AssetImage(image),
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        Text(
          textInfo,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
