import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  final String image;
  final double? size;
  const WeatherImage({
    required this.image,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.sizeOf(context);
    return Image(
      width: size ?? size1.width * 0.3,
      height: size ?? size1.height * 0.15,
      image: AssetImage(
        image,
      ),
    );
  }
}
