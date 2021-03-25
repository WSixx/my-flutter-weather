import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_wather_app/day_night.dart';
import 'package:my_wather_app/weather.dart';

class WeatherCityWidget extends StatelessWidget {
  final Weather weatherData;

  WeatherCityWidget({this.weatherData});
  final DayNight dayNight = DayNight();

  Color tempColor() {
    dayNight.getTempColor(weatherData.results.temp);
    return dayNight.tempColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(7),
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                color: tempColor(),
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
                      weatherData.results.temp.toString(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              padding: EdgeInsets.all(40),
              children: [
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white54,
                      gradient: LinearGradient(
                          colors: [Colors.red[900], Colors.yellowAccent])),
                  child: Center(
                    child: Text(
                      weatherData.results.sunrise.toString(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white54,
                      gradient: LinearGradient(
                          colors: [Colors.yellowAccent, Colors.red[900]])),
                  child: Center(
                    child: Text(
                      weatherData.results.sunrise.toString(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      /*Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54,
                    gradient: LinearGradient(
                        colors: [Colors.red[900], Colors.yellowAccent])),
                child: Center(
                  child: Text(
                    weatherData.results.sunrise.toString(),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2),
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54,
                    gradient: LinearGradient(
                        colors: [Colors.yellowAccent, Colors.red[900]])),
                child: Center(
                  child: Text(
                    weatherData.results.sunrise.toString(),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: tempColor(),
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
                        weatherData.results.temp.toString(),
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
                    weatherData.results.sunrise.toString(),
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
                    weatherData.results.sunset.toString(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),*/
    );
  }
}
