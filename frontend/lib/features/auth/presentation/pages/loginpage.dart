import 'package:flutter/material.dart';
import 'package:frontend/features/auth/presentation/widgets/continue_with_google_button.dart';
import 'package:frontend/features/auth/presentation/widgets/custom_email_field.dart';

import '../../../../utility/or_line.dart';
import '../widgets/custom_password_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login in to your \nAccount',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 14,
                children: [
                  CustomEmailField(controller: emailController),
                  CustomPasswordField(
                    passwordController: passwordController,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Sign in'),
                  ),
                  OrLine(),
                  ContinueWithGoogleButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
