import 'package:customer_flutter_offline/core/styles/colors_app.dart';
import 'package:customer_flutter_offline/core/styles/space.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    required this.title,
    required this.totalItems,
    super.key,
  });

  final String title;
  final int totalItems;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BottomAppBar(
        height: Space.xl,
        shape: const CircularNotchedRectangle(),
        color: ColorsApp.primaryColor,
        child: Row(
          children: [
            Text(
              '$title:',
              style: const TextStyle(
                fontSize: Space.md,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: ColorsApp.secondaryColor,
              ),
            ),
            const SizedBox(width: Space.sm),
            Text(
              totalItems.toString(),
              style: const TextStyle(
                fontSize: Space.md,
                fontWeight: FontWeight.bold,
                color: ColorsApp.secondaryColor,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
