import 'package:flutter/material.dart';

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
              child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Logout'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Sign in with password'),
              )
            ],
          )),
        ],
      ),
    );
  }
}
