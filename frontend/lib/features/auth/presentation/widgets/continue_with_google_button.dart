import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContinueWithGoogleButton extends StatelessWidget {
  const ContinueWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        label: Text(
        "   Continue with Google",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        icon: FaIcon(
          FontAwesomeIcons.google, // Google icon from Font Awesome
          size: 24, // Color for the icon
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), 
          ),
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          )
        ),
    );
  }
}
