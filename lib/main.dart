import 'package:customer_flutter_offline/core/styles/themes.dart';
import 'package:customer_flutter_offline/injection/config.dart';
import 'package:customer_flutter_offline/routing/app_navigator.dart';
import 'package:customer_flutter_offline/routing/app_router.dart';
import 'package:customer_flutter_offline/routing/app_routes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appNavigator = getIt<AppNavigator>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viasoft Challenge',
      navigatorKey: appNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData.from(colorScheme: lightColorScheme, useMaterial3: true),
    );
  }
}
