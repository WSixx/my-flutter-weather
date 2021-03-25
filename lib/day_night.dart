import 'package:flutter/material.dart';

class DayNight extends ChangeNotifier {
  Color _color;
  Color _tempColor;
  Image _image;
  String _textTest;

  Color get color => _color;
  Color get tempColor => _tempColor;
  Image get image => _image;
  String get textTest => _textTest;

  DayNight() {
    getDayNight();
  }

  void getTempColor(int temp) {
    if (temp < 15) {
      _tempColor = Color.fromRGBO(146, 183, 248, 1);
    } else if (temp >= 15 && temp < 25) {
      _tempColor = Color.fromRGBO(125, 170, 249, 1);
    } else if (temp >= 25 && temp < 30) {
      _tempColor = Color.fromRGBO(243, 156, 18, 1);
    } else {
      _tempColor = Color.fromRGBO(250, 29, 29, 0.7);
    }
  }

  void getDayNight() {
    var hour = DateTime.now().hour;
    if (hour < 17) {
      _image = Image.asset('assets/images/sun.png');
      _color = Colors.blue;
      notifyListeners();
    } else {
      _image = Image.asset('assets/images/moon.png');
      _color = Colors.deepPurple;
      notifyListeners();
    }
  }
}
