// presentation/widgets/weather_widget.dart
import 'package:flutter/material.dart';

import '../../data/weather_repository.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: weatherRepository.getWeather(), // Implement the repository method to get the weather
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error fetching weather');
        } else {
          final weather = snapshot.data;

          return Container(
            width: 366,
            height: 244,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(weather!.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${weather.temperature}°C',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  weather.name,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
