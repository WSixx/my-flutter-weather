import 'package:flutter/material.dart';
import 'package:my_wather_app/weather_api.dart';

class WeatherTopWidget extends StatefulWidget {
  final WeatherApi apiData;

  const WeatherTopWidget({Key key, this.apiData}) : super(key: key);

  @override
  _WeatherTopWidgetState createState() => _WeatherTopWidgetState();
}

class _WeatherTopWidgetState extends State<WeatherTopWidget>
    with SingleTickerProviderStateMixin {
  AnimationController rotationController;
  AnimationController cloudController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 25),
    );
    rotationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.apiData.getWeatherResults(),
        builder: (context, snapshot) {
          return Container(
            //height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: rotationController,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        child: Image.asset('assets/images/cloud.png'),
                      ),
                    ],
                  ),
                  builder: (BuildContext context, Widget _widget) {
                    return Transform.translate(
                      offset: Offset(15, rotationController.value * 100),
                      child: _widget,
                    );
                  },
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: AnimatedBuilder(
                      animation: rotationController,
                      child: Image.asset('assets/images/sun.png'),
                      builder: (BuildContext context, Widget _widget) {
                        return Transform.rotate(
                          angle: rotationController.value * 6.3,
                          child: _widget,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
