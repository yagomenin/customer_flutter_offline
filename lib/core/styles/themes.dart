import 'package:customer_flutter_offline/core/styles/colors_app.dart';
import 'package:flutter/material.dart';

ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: ColorsApp.primaryColor,
  onPrimary: ColorsApp.secondaryColor,
  secondary: ColorsApp.secondaryColor,
  onSecondary: ColorsApp.textColor,
  error: ColorsApp.errorColor,
  onError: ColorsApp.secondaryColor,
  surface: ColorsApp.secondaryColor,
  onSurface: Color.fromARGB(255, 46, 34, 34),
);
