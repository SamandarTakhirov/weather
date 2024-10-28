import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:test_weather/core/widgets/function/regions.dart';

import '../../constants/app_images.dart';
import '../../core/models/weather_model.dart';
import '../../data/repository.dart';

part "main_state.dart";

part "main_event.dart";

class MainBloc extends Bloc<MainEvent, MainState> {
  final apiRepository = AppRepository();

  MainBloc() : super(const MainState()) {
    on<MainEvent>(
      (event, emit) => switch (event) {
        ChangeRegionEvent event => _onChangeRegion(event, emit),
        StartEvent event => _onStart(event, emit),
      },
    );
  }

  FutureOr<void> _onChangeRegion(
      ChangeRegionEvent event, Emitter<MainState> emit) async {
    emit(state.copyWith(
      weatherModel: event.weatherModel,
    ));
  }

  Future<void> _onStart(StartEvent event, Emitter<MainState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final weathers = await Future.wait(regions
        .map(
          (e) => apiRepository.weather(
              e['timezone'] as String,
              e['latitude'].toString(),
              e['longitude'].toString(),
              e['image'] as String,
              e['regionName'] as String),
        )
        .toList());
    final weather = weathers.first;
    emit(state.copyWith(
      weatherModel: weather,
      weathers: weathers,
      regionName: weather.regionName,
      imagePath: weather.imagePath,
      status: FormzSubmissionStatus.success,
    ));
  }
}
