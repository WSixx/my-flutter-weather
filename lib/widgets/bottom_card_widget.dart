import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_wather_app/weather.dart';
import 'package:my_wather_app/weather_api.dart';
import 'package:my_wather_app/widgets/weather_city_widget.dart';

class BottomCardWidget extends StatelessWidget {
  final WeatherApi apiData;
  const BottomCardWidget({@required this.apiData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: apiData.getWeatherResults(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? WeatherCityWidget(
                weatherData: snapshot.data,
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
