import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/auth/presentation/pages/homepage.dart';
import 'package:frontend/features/auth/presentation/pages/loginpage.dart';
import 'package:go_router/go_router.dart';

class SmartTrafficApp extends StatelessWidget {
  const SmartTrafficApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: "/login",
        builder: (context, state) => LoginPage(),
      ),
    ]);
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}
