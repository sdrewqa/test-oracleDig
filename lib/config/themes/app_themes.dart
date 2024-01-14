import 'package:flutter/material.dart';

import '../../gen/fonts.gen.dart';

class AppThemes {
  static ThemeData themeData = ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)), // Радиус
          borderSide:
              BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)), // Радиус
          borderSide:
              BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
        ),
      ),
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.comfortaa),
          displayMedium: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              fontFamily: FontFamily.roboto),
          displaySmall: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.roboto)));
}
