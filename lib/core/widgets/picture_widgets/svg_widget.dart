import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_weather/constants/app_colors.dart';

class SvgWidget extends StatelessWidget {
  final String image;
  final Color? color = AppColors.white;
  final double size;

  SvgWidget({
    required this.image,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      color: color,
      width: size,
      height: size,
    );
  }
}
