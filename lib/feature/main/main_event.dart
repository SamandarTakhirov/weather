part of 'main_bloc.dart';

sealed class MainEvent {
  const MainEvent();
}

class ChangeRegionEvent extends MainEvent {
  final WeatherModel weatherModel;

  const ChangeRegionEvent({
    required this.weatherModel,
  });
}

class StartEvent extends MainEvent {}
