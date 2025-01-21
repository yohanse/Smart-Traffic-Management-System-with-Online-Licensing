import 'package:flutter/material.dart';
import 'package:frontend/features/auth/presentation/widgets/continue_with_google_button.dart';
import 'package:frontend/utility/or_line.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ' Let\'s you in officer',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 10,
                children: [
                  ContinueWithGoogleButton(),
                  OrLine(),
                  ElevatedButton(
                    onPressed: () => context.go("/login"),
                    child: Text('Sign in with password'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
