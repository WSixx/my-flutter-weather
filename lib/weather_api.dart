import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:my_wather_app/utils/constants.dart';
import 'package:my_wather_app/weather.dart';

class WeatherApi {
  //final weather = Weather.fromJson(json);
  final String _baseUrl = Constants.BASE_API_URL;
  List<Weather> weatherList;

  /*List<Weather> parseWeather(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<dynamic, dynamic>();
    print(parsed);
    return parsed.map<Weather>((json) => Weather.fromJson(json)).toList();
  }*/

  Future<Map<String, dynamic>> getWeatherResults() async {
    final response = await http.get(Uri.parse(_baseUrl));
    Map<String, dynamic> data = json.decode(response.body);
    print(response.body);
    return Weather.fromMap(json.decode(response.body)).toMap();
  }
}
