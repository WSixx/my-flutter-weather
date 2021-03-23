// To parse this JSON data, do
//
//     final weather = weatherFromMap(jsonString);

import 'dart:convert';

Weather weatherFromMap(String str) => Weather.fromMap(json.decode(str));

String weatherToMap(Weather data) => json.encode(data.toMap());

class Weather {
  Weather({
    this.by,
    this.validKey,
    this.results,
    this.executionTime,
    this.fromCache,
  });

  final String by;
  final bool validKey;
  final Results results;
  final double executionTime;
  final bool fromCache;

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        by: json["by"],
        validKey: json["valid_key"],
        results: Results.fromMap(json["results"]),
        executionTime: json["execution_time"],
        fromCache: json["from_cache"],
      );

  Map<String, dynamic> toMap() => {
        "by": by,
        "valid_key": validKey,
        "results": results.toMap(),
        "execution_time": executionTime,
        "from_cache": fromCache,
      };
}

class Results {
  Results({
    this.temp,
    this.date,
    this.time,
    this.conditionCode,
    this.description,
    this.currently,
    this.cid,
    this.city,
    this.imgId,
    this.humidity,
    this.windSpeedy,
    this.sunrise,
    this.sunset,
    this.conditionSlug,
    this.cityName,
    this.forecast,
  });

  final int temp;
  final String date;
  final String time;
  final String conditionCode;
  final String description;
  final String currently;
  final String cid;
  final String city;
  final String imgId;
  final int humidity;
  final String windSpeedy;
  final String sunrise;
  final String sunset;
  final String conditionSlug;
  final String cityName;
  final List<Forecast> forecast;

  factory Results.fromMap(Map<String, dynamic> json) => Results(
        temp: json["temp"],
        date: json["date"],
        time: json["time"],
        conditionCode: json["condition_code"],
        description: json["description"],
        currently: json["currently"],
        cid: json["cid"],
        city: json["city"],
        imgId: json["img_id"],
        humidity: json["humidity"],
        windSpeedy: json["wind_speedy"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        conditionSlug: json["condition_slug"],
        cityName: json["city_name"],
        forecast: List<Forecast>.from(
            json["forecast"].map((x) => Forecast.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "temp": temp,
        "date": date,
        "time": time,
        "condition_code": conditionCode,
        "description": description,
        "currently": currently,
        "cid": cid,
        "city": city,
        "img_id": imgId,
        "humidity": humidity,
        "wind_speedy": windSpeedy,
        "sunrise": sunrise,
        "sunset": sunset,
        "condition_slug": conditionSlug,
        "city_name": cityName,
        "forecast": List<dynamic>.from(forecast.map((x) => x.toMap())),
      };
}

class Forecast {
  Forecast({
    this.date,
    this.weekday,
    this.max,
    this.min,
    this.description,
    this.condition,
  });

  final String date;
  final String weekday;
  final int max;
  final int min;
  final Description description;
  final Condition condition;

  factory Forecast.fromMap(Map<String, dynamic> json) => Forecast(
        date: json["date"],
        weekday: json["weekday"],
        max: json["max"],
        min: json["min"],
        description: descriptionValues.map[json["description"]],
        condition: conditionValues.map[json["condition"]],
      );

  Map<String, dynamic> toMap() => {
        "date": date,
        "weekday": weekday,
        "max": max,
        "min": min,
        "description": descriptionValues.reverse[description],
        "condition": conditionValues.reverse[condition],
      };
}

enum Condition { CLOUDLY_DAY, STORM }

final conditionValues = EnumValues(
    {"cloudly_day": Condition.CLOUDLY_DAY, "storm": Condition.STORM});

enum Description {
  PARCIALMENTE_NUBLADO,
  TEMPESTADES,
  ENSOLARADO_COM_MUITAS_NUVENS
}

final descriptionValues = EnumValues({
  "Ensolarado com muitas nuvens": Description.ENSOLARADO_COM_MUITAS_NUVENS,
  "Parcialmente nublado": Description.PARCIALMENTE_NUBLADO,
  "Tempestades": Description.TEMPESTADES
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
