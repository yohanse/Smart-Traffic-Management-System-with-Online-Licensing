import 'package:flutter/material.dart';

class CustomEmailField extends StatelessWidget {
  final TextEditingController controller;
  const CustomEmailField(
      {super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        hintText: 'Email',
        hintStyle: Theme.of(context).textTheme.bodyMedium,

        // filled: true,
        // fillColor: Colors.transparent, // Set transparent background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Set border radius
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface, // Set border color
            width: 0.5, // Set border width
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}