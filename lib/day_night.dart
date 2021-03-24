import 'package:flutter/material.dart';

class DayNight extends ChangeNotifier {
  Color _color;
  Image _image;
  String _textTest;

  Color get color => _color;
  Image get image => _image;
  String get textTest => _textTest;

  DayNight() {
    getDayNight();
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
