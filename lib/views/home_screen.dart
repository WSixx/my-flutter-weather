import 'package:flutter/material.dart';
import 'package:my_wather_app/widgets/bottom_card_widget.dart';
import 'package:my_wather_app/widgets/weather_top_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: WeatherTopWidget(),
            ),
            Expanded(
              flex: 5,
              child: BottomCardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
