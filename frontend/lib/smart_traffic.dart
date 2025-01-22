import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/auth/presentation/bloc/signin/signinwithgoogle_bloc.dart';
import 'package:frontend/features/auth/presentation/pages/homepage.dart';
import 'package:frontend/features/auth/presentation/pages/loginpage.dart';
import 'package:frontend/features/auth/presentation/pages/testpage.dart';
import 'package:frontend/injection.dart';
import 'package:frontend/utility/theme.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/presentation/bloc/login/login_bloc.dart';

class SmartTrafficApp extends StatelessWidget {
  const SmartTrafficApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: "/test",
          builder: (context, state) => TestPage(),
        ),
      ],
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => sl<LoginBloc>(),
        ),
        BlocProvider<SigninwithgoogleBloc>(
          create: (context) => sl<SigninwithgoogleBloc>(),
        ),
      ],
      child: MaterialApp.router(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
