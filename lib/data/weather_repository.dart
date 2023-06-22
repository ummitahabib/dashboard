import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherRepository {
  Future<Weather> getWeather() async {
    final apiUrl = 'https://api.example.com/weather'; // Replace with your API endpoint URL

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        final temperature = jsonData['temperature'];
        final name = jsonData['name'];
        final condition = jsonData['condition'];
        final backgroundImage = _getBackgroundImageFromCondition(condition);

        return Weather(temperature: temperature, name: name, backgroundImage: backgroundImage);
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  String _getBackgroundImageFromCondition(String condition) {
    // Define the mapping of condition to background image
    final Map<String, String> conditionToImage = {
      'Sunny': 'assets/images/sunny.jpg', // Replace with the actual image asset paths for each condition
      'Cloudy': 'assets/images/cloudy.jpg',
      'Partly cloudy': 'assets/images/partly_cloudy.jpg',
      'Rainy': 'assets/images/rainy.jpg',
      'Showers': 'assets/images/showers.jpg',
      'Thunderstorms': 'assets/images/thunderstorms.jpg',
      'Snowy': 'assets/images/snowy.jpg',
      'Foggy': 'assets/images/foggy.jpg',
      'Misty': 'assets/images/misty.jpg',
      'Hazy': 'assets/images/hazy.jpg',
      'Windy': 'assets/images/windy.jpg',
      'Stormy': 'assets/images/stormy.jpg',
      'Overcast': 'assets/images/overcast.jpg',
      'Freezing rain': 'assets/images/freezing_rain.jpg',
      'Sleet': 'assets/images/sleet.jpg',
      'Blustery': 'assets/images/blustery.jpg',
      'Tornado': 'assets/images/tornado.jpg',
      'Hurricane': 'assets/images/hurricane.jpg',
      'Dust storm': 'assets/images/dust_storm.jpg',
      'Heatwave': 'assets/images/heatwave.jpg',
      'Cold snap': 'assets/images/cold_snap.jpg',
      'Drought': 'assets/images/drought.jpg',
    };

    return conditionToImage[condition] ?? 'assets/images/default_background.jpg'; // Default image if condition not found
  }
}

class Weather {
  final double temperature;
  final String name;
  final String backgroundImage;

  Weather({required this.temperature, required this.name, required this.backgroundImage});
}
