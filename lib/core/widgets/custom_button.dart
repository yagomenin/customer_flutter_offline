import 'package:customer_flutter_offline/core/styles/space.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.textButton,
    super.key,
  });

  final VoidCallback onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Space.sm),
      child: ElevatedButton(onPressed: onPressed, child: Text(textButton)),
    );
  }
}
