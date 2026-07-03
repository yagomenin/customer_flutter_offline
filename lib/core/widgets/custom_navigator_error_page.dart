import 'package:flutter/material.dart';

class CustomNavigatorErrorPage extends StatelessWidget{
  const CustomNavigatorErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: const Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.sentiment_dissatisfied, size: 32),
          SizedBox(height: 16),
          Text('Está pagina não existe'),
        ],
      ),
    ),
   );
  }
}