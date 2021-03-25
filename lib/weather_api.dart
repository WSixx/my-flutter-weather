import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:my_wather_app/utils/constants.dart';
import 'package:my_wather_app/weather.dart';

class WeatherApi {
  //final weather = Weather.fromJson(json);
  final String _baseUrl = Constants.BASE_API_URL + '?key=${env['API_KEY']}';
  List<Weather> weatherList;

  /*List<Weather> parseWeather(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<dynamic, dynamic>();
    print(parsed);
    return parsed.map<Weather>((json) => Weather.fromJson(json)).toList();
  }*/

  Future<Weather> getWeatherResults() async {
    final response = await http.get(Uri.parse(_baseUrl));
    Map<String, dynamic> data = json.decode(response.body);
    //Weather.fromMap(json.decode(response.body)).toMap();
    return Weather.fromMap(data);
  }
}
