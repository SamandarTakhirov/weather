import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../core/models/weather_model.dart';

class AppRepository {
  final Dio _dio = Dio()
    ..interceptors.addAll([
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        request: true,
        enabled: true,
        compact: true,
      ),
    ]);

  final String _baseUrl = "https://api.open-meteo.com";

  Future<WeatherModel> weather(String location, String lat, String long,
      String image, String regionName) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/v1/forecast',
        queryParameters: {
          'latitude': lat,
          'longitude': long,
          'daily':
              'temperature_2m_max,temperature_2m_min,precipitation_sum,wind_speed_10m_max'
                  ',weather_code,precipitation_probability_mean,apparent_temperature_max',
          'timezone': location,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, Object?>;
        return WeatherModel.fromJson(data, image, regionName);
      } else {
        throw Exception('API response error: ${response.statusCode}');
      }
    } catch (e, s) {
      print('Error: $e');
      print('Stack Trace: $s');
      throw Exception('Error throw: ${e.toString()}');
    }
  }
}
