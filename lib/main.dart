import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_weather/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await DataBaseService.create();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MainApp());
}
