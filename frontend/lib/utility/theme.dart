import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.blue,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.blueAccent,
    onSurface: Colors.grey[300]!,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // Button color for light theme
      foregroundColor: Colors.black, // Text color for light theme
      padding: EdgeInsets.symmetric(vertical: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        color: Colors.black, fontSize: 40, fontWeight: FontWeight.w900),
    bodyMedium: TextStyle(color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.blue,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.blueAccent,
    onSurface: Colors.grey[700]!,
  ),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // Button color for light theme
      foregroundColor: Colors.white, // Text color for light theme
      padding: EdgeInsets.symmetric(vertical: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900),
    bodyMedium: TextStyle(color: Colors.white),
  ),
);
