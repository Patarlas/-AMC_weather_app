import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather.dart';

void main() {
  group('Weather Model - fromJson Unit Tests', () {
    test('should return a valid Weather object from Manila sample JSON', () {
      // 1. Arrange: Realistic Manila sample from OpenWeatherMap API
      final Map<String, dynamic> manilaJson = {
        "coord": {"lon": 120.9822, "lat": 14.6042},
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04d"
          }
        ],
        "main": {
          "temp": 31.02,
          "feels_like": 35.84,
          "temp_min": 30.06,
          "temp_max": 32.15,
          "pressure": 1008,
          "humidity": 62
        },
        "wind": {"speed": 4.63, "deg": 70},
        "name": "Manila",
        "cod": 200
      };

      // 2. Act: Call the fromJson factory
      final weather = Weather.fromJson(manilaJson);

      // 3. Assert: Verify the data is parsed correctly
      expect(weather.city, 'Manila');
      expect(weather.temperature, 31.02);
      expect(weather.description, 'broken clouds');
      expect(weather.humidity, 62);
      expect(weather.windSpeed, 4.63);
    });

    test('should handle integer temperatures safely (API safety)', () {
      // API often sends 30 instead of 30.0
      final Map<String, dynamic> jsonWithInt = {
        "weather": [{"description": "clear sky"}],
        "main": {"temp": 30, "humidity": 50},
        "wind": {"speed": 5},
        "name": "Manila"
      };

      final weather = Weather.fromJson(jsonWithInt);

      expect(weather.temperature, 30.0);
      expect(weather.windSpeed, 5.0);
    });
  });
}