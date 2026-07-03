import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void navigateTo(String routeName, {Object? arguments}) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  void replaceWith(String routeName, {Object? arguments}) {
    navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void popUntilRoot() {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }
}
