import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String customer = '/customer';
  static const String customerForm = '/customer/form';
}

extension NavigationExtensions on BuildContext {
  Future<void> navigateTo({
    required BuildContext context,
    required String routeName,
    Object? arguments,
    bool? replace,
    bool? removeLastPage,
  }) async {
    if (replace == true) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        (route) => false,
        arguments: arguments,
      );
    } else if (removeLastPage == true) {
      Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
    } else {
      Navigator.pushNamed(context, routeName, arguments: arguments);
    }
  }
}
