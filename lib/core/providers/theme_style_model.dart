import 'package:flutter/material.dart';

class ThemeStyleModel with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void setThemeData(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
