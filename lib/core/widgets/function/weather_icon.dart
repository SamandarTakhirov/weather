import '../../../constants/app_images.dart';

String getWeatherIcon(int code) {
  if (code == 0) {
    return AppImages.img6;
  } else if ([1, 2, 3].contains(code)) {
    return AppImages.img7;
  } else if ([45, 48].contains(code)) {
    return AppImages.img8;
  } else if ([51, 53, 55, 56, 57, 61, 63, 65, 66, 67, 80, 81, 82]
      .contains(code)) {
    return AppImages.img2;
  } else if ([71, 73, 75, 77, 85, 86].contains(code)) {
    return AppImages.img4;
  } else if ([95, 96, 99].contains(code)) {
    return AppImages.img9;
  } else {
    return AppImages.img1;
  }
}
