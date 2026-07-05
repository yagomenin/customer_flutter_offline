import 'package:customer_flutter_offline/core/styles/space.dart';
import 'package:flutter/material.dart';

class CustomEmptyPage extends StatelessWidget {
  const CustomEmptyPage({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.folder_open, size: Space.xl),
          const SizedBox(height: Space.md),
          Text(
            message,
            style: TextStyle(fontSize: Space.md, fontWeight: .bold),
          ),
        ],
      ),
    );
  }
}
