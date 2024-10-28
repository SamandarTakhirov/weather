part of 'main_bloc.dart';

class MainState extends Equatable {
  final String regionName;
  final String imagePath;
  final WeatherModel weatherModel;
  final List<WeatherModel> weathers;
  final FormzSubmissionStatus status;

  const MainState({
    this.regionName = 'Location',
    this.imagePath = AppImages.tashkent,
    this.weatherModel = const WeatherModel(),
    this.weathers = const [],
    this.status = FormzSubmissionStatus.initial,
  });

  @override
  List<Object> get props => [
        regionName,
        imagePath,
        weathers,
        weatherModel,
        status,
      ];

  MainState copyWith({
    String? regionName,
    String? imagePath,
    WeatherModel? weatherModel,
    List<WeatherModel>? weathers,
    FormzSubmissionStatus? status,
  }) {
    return MainState(
      regionName: regionName ?? this.regionName,
      imagePath: imagePath ?? this.imagePath,
      weatherModel: weatherModel ?? this.weatherModel,
      status: status ?? this.status,
      weathers: weathers ?? this.weathers,
    );
  }
}
