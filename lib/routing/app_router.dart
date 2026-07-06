import 'package:customer_flutter_offline/core/widgets/custom_navigator_error_page.dart';
import 'package:customer_flutter_offline/features/customer/presentation/widgets/customer_form_page.dart';
import 'package:customer_flutter_offline/features/customer/presentation/widgets/customer_page.dart';
import 'package:customer_flutter_offline/features/customer/presentation/widgets/navigation/customer_form_arguments.dart';
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
      case AppRoutes.customerForm:
        final arguments = settings.arguments as CustomerFormArguments;
        return MaterialPageRoute(
          builder: (_) => CustomerFormPage(arguments: arguments),
        );
      default:
        return MaterialPageRoute(builder: (_) => CustomNavigatorErrorPage());
    }
  }
}
