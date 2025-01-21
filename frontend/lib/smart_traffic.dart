import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/auth/presentation/pages/homepage.dart';
import 'package:frontend/features/auth/presentation/pages/loginpage.dart';
import 'package:frontend/utility/theme.dart';
import 'package:go_router/go_router.dart';

class SmartTrafficApp extends StatelessWidget {
  const SmartTrafficApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => LoginPage(),
        ),
      ],
    );
    return MaterialApp.router(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      );
  }
}
