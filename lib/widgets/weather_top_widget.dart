import 'package:flutter/material.dart';

class WeatherTopWidget extends StatefulWidget {
  @override
  _WeatherTopWidgetState createState() => _WeatherTopWidgetState();
}

class _WeatherTopWidgetState extends State<WeatherTopWidget>
    with SingleTickerProviderStateMixin {
  AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );
    rotationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: EdgeInsets.all(40),
        child: AnimatedBuilder(
          animation: rotationController,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset('assets/images/sun.png'),
          ),
          builder: (BuildContext context, Widget _widget) {
            return Transform.rotate(
              angle: rotationController.value * 6.3,
              child: _widget,
            );
          },
        ),
      ),
    );
  }
}
