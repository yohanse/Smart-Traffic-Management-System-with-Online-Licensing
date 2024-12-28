import 'package:flutter/material.dart';

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.onSurface, // Line color
            thickness: 1, // Line thickness
            indent: 16, // Left padding
            endIndent: 16, // Right padding
          ),
        ),
        Text("Or", style: Theme.of(context).textTheme.bodyMedium,),
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.onSurface, // Line color
            thickness: 1, // Line thickness
            indent: 16, // Left padding
            endIndent: 16, // Right padding
          ),
        ),
      ],
    );
  }
}
