import 'package:http/http.dart';
import 'dart:convert';
import '../models/weather.dart';

class WeatherService {
  static const String apikey = '';
  static const String baseUrl = 'https://api.weathermap.org/data/2.5/weather';

  static Future<Weather> getWeather(String CityName) async {
    try {
      final String url = '$baseUrl?q=$CityName&appid=$apikey&units=metric';

      final http.Response response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      // FIX 1: Changed statuscode to statusCode
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return Weather.fromJson(data);
      }
      else if (response.statusCode == 404) {
        throw Exception('City Not Found');
      }
      else {
        throw Exception('Failed to load weather');
      }
    } catch (e) {
      throw Exception('Error fetching weather: $e');
    }
  } // Removed extra brace that was here
} // Removed extra brace that was at the end
