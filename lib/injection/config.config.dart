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
import 'package:customer_flutter_offline/features/customer/data/repositories/customer_repository_impl.dart'
    as _i534;
import 'package:customer_flutter_offline/features/customer/domain/repositories/customer_repository.dart'
    as _i101;
import 'package:customer_flutter_offline/features/customer/domain/usecases/delete_customer_use_case.dart'
    as _i774;
import 'package:customer_flutter_offline/features/customer/domain/usecases/get_customer_use_case.dart'
    as _i985;
import 'package:customer_flutter_offline/features/customer/domain/usecases/save_customer_use_case.dart'
    as _i324;
import 'package:customer_flutter_offline/features/customer/domain/usecases/update_customer_use_case.dart'
    as _i667;
import 'package:customer_flutter_offline/features/customer/presentation/cubit/customer_cubit.dart'
    as _i813;
import 'package:customer_flutter_offline/features/data/datasource/local_datasource.dart'
    as _i573;
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
    gh.factory<_i573.LocalDatasource>(
      () => _i573.LocalDatasourceImpl(gh<_i954.DatabaseHelper>()),
    );
    gh.factory<_i101.CustomerRepository>(
      () => _i534.CustomerRepositoryImpl(gh<_i573.LocalDatasource>()),
    );
    gh.lazySingleton<_i774.DeleteCustomerUseCase>(
      () => _i774.DeleteCustomerUseCase(gh<_i101.CustomerRepository>()),
    );
    gh.lazySingleton<_i985.GetCustomerUseCase>(
      () => _i985.GetCustomerUseCase(gh<_i101.CustomerRepository>()),
    );
    gh.lazySingleton<_i324.SaveCustomerUseCase>(
      () => _i324.SaveCustomerUseCase(gh<_i101.CustomerRepository>()),
    );
    gh.lazySingleton<_i667.UpdateCustomerUseCase>(
      () => _i667.UpdateCustomerUseCase(gh<_i101.CustomerRepository>()),
    );
    gh.factory<_i813.CustomerCubit>(
      () => _i813.CustomerCubit(
        gh<_i985.GetCustomerUseCase>(),
        gh<_i324.SaveCustomerUseCase>(),
        gh<_i667.UpdateCustomerUseCase>(),
        gh<_i774.DeleteCustomerUseCase>(),
      ),
    );
    return this;
  }
}
