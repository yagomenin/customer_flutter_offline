// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:customer_flutter_offline/core/database/database_helper.dart'
    as _i954;
import 'package:customer_flutter_offline/features/splash/presentation/cubit/splash_cubit.dart'
    as _i736;
import 'package:customer_flutter_offline/routing/app_navigator.dart' as _i793;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i736.SplashCubit>(() => _i736.SplashCubit());
    gh.lazySingleton<_i954.DatabaseHelper>(() => _i954.DatabaseHelper());
    gh.lazySingleton<_i793.AppNavigator>(() => _i793.AppNavigator());
    return this;
  }
}
