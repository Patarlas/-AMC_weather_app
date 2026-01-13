import 'package:flutter/material.dart';
import 'pages/weather_page.dart'; // 1. Import your weather page here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Optional: removes the red debug banner
      title: 'Weather App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue, // Weather apps usually look good in blue
      ),
      // 2. Set your WeatherPage as the home
      home: const WeatherPage(),
    );
  }
}