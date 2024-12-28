import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.blue,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.w900),
    bodyMedium: TextStyle(color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.blue,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900),
    bodyMedium: TextStyle(color: Colors.white),
  ),
);