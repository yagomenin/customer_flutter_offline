import 'dart:math';

import 'package:flutter/material.dart';

class ColorsApp {
  static const Color secondaryColor = Colors.white;
  static const Color textColor = Colors.black;
  static const Color surface = Color.fromARGB(255, 231, 225, 225);
  static const Color errorColor = Colors.red;
  static const Color primaryColor = Color.fromARGB(255, 116, 24, 18);
  static const Color lowGrey = Color.fromARGB(255, 207, 207, 207);

  static Color generateRandomColor(int seed) {
    final rand = Random(seed);
    return Color.fromARGB(
      255,
      rand.nextInt(256),
      rand.nextInt(256),
      rand.nextInt(256),
    );
  }
}
