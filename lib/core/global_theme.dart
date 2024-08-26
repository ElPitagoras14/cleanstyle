import 'package:flutter/material.dart';

class GlobalTheme {
  static final lightThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.light,
    ),
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: Colors.indigo,
    //   foregroundColor: Colors.white,
    // ),
    scaffoldBackgroundColor: Colors.white,
  );

  static final darkThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.dark,
    ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.indigo[700],
    //   foregroundColor: Colors.white,
    // ),
    scaffoldBackgroundColor: Colors.black,
  );
}
