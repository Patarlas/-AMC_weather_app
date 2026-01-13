import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // Reference your service
  final _weatherService = WeatherService();
  Weather? _weather;

  // Method to fetch weather
  _fetchWeather() async {
    // For now, let's hardcode 'Manila'
    try {
      final weather = await WeatherService.getWeather("Manila");
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display City Name
            Text(_weather?.cityName ?? "Loading city..."),

            // Display Temperature
            Text("${_weather?.temperature.round()}°C"),

            // Display Condition
            Text(_weather?.mainCondition ?? ""),
          ],
        ),
      ),
    );
  }
}