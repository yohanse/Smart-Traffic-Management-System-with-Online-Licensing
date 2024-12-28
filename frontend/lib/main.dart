import 'package:flutter/material.dart';
import 'package:frontend/features/auth/presentation/pages/homepage.dart';
import 'package:frontend/utility/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
