import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  const CustomPasswordField({super.key, required this.passwordController});

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

bool obscure = true;

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      controller: widget.passwordController,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.password,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        suffixIcon: IconButton(
          color: Theme.of(context).colorScheme.onSurface,
          icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              obscure = !obscure;
            });
          },
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        hintText: 'Password',
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