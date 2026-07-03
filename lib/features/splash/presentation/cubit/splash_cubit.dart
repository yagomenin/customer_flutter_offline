import 'package:customer_flutter_offline/features/splash/presentation/cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitalState());

  Future<void> initSplash() async {
    emit(SplashLoadingState());
    await Future.delayed(const Duration(seconds: 5));
    emit(SplashSuccessState());
  }
}
