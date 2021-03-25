import 'package:flutter/material.dart';
import 'package:my_wather_app/day_night.dart';
import 'package:my_wather_app/weather.dart';
import 'package:my_wather_app/weather_api.dart';
import 'package:my_wather_app/widgets/bottom_card_widget.dart';
import 'package:my_wather_app/widgets/weather_top_widget.dart';

class HomeScreen extends StatelessWidget {
  final WeatherApi apiData = WeatherApi();
  final DayNight dayNight = DayNight();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: apiData.getWeatherResults(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? Scaffold(
                appBar: AppBar(
                  title: Text(snapshot.data.results.cityName),
                  centerTitle: true,
                ),
                body: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: WeatherTopWidget(
                          apiData: apiData,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: BottomCardWidget(
                          apiData: apiData,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
