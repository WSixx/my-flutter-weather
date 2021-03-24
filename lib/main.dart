import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:my_wather_app/day_night.dart';
import 'package:my_wather_app/utils/app_routes.dart';
import 'package:my_wather_app/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  await DotEnv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(
      create: (context) => DayNight(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color dayNight = DayNight().color;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My clima',
      theme: ThemeData(
        primarySwatch: dayNight,
      ),
      routes: {
        AppRoutes.HOME: (context) => HomeScreen(),
      },
    );
  }
}
