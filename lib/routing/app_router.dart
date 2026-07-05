import 'package:customer_flutter_offline/core/widgets/custom_navigator_error_page.dart';
import 'package:customer_flutter_offline/features/customer/presentation/widgets/customer_page.dart';
import 'package:customer_flutter_offline/features/splash/presentation/widgets/splash_page.dart';
import 'package:customer_flutter_offline/routing/app_routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case AppRoutes.customer:
        return MaterialPageRoute(builder: (_) => CustomerPage());
      default:
        return MaterialPageRoute(builder: (_) => CustomNavigatorErrorPage());
    }
  }
}
