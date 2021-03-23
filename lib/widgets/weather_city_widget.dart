import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherCityWidget extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  WeatherCityWidget({this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.thermometerQuarter,
                      size: 20,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      weatherData['results']['temp'].toString(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  weatherData['results']['temp'].toString(),
                ),
              ),
            ),
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  weatherData['results']['temp'].toString(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
