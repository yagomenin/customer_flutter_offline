import 'package:customer_flutter_offline/core/styles/space.dart';
import 'package:customer_flutter_offline/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:customer_flutter_offline/features/splash/presentation/cubit/splash_state.dart';
import 'package:customer_flutter_offline/injection/config.dart';
import 'package:customer_flutter_offline/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  late final SplashCubit cubit;

  @override
  void initState() {
    cubit = getIt.get<SplashCubit>();
    cubit.initSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccessState) {
            context.navigateTo(
              context: context,
              routeName: AppRoutes.customer,
              replace: true,
            );
          }
        },
        builder: (BuildContext context, Object state) {
          if (state is SplashLoadingState) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Text('VS', style: TextStyle(fontSize: Space.xl)),
                    const SizedBox(height: Space.md),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
