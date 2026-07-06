import 'package:customer_flutter_offline/core/styles/space.dart';
import 'package:flutter/material.dart';

class CustomLabelTextForm extends StatelessWidget {
  const CustomLabelTextForm({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: Space.md - 4,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    );
  }
}
