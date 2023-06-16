//@GeneratedMicroModule;CustomersServicePackageModule;package:customers_service/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_data/core_data.dart' as _i5;
import 'package:core_dependency/core_dependency.dart' as _i8;
import 'package:core_router/core_router.dart' as _i6;
import 'package:customers_service/core/database/database.dart' as _i13;
import 'package:customers_service/core/router/customers_router.dart' as _i14;
import 'package:customers_service/src/customer_info/customer_info_controller.dart'
    as _i3;
import 'package:customers_service/src/customer_info/customer_info_popup.dart'
    as _i4;
import 'package:customers_service/src/customers/data/data_source/customers_remote_data_source.dart'
    as _i7;
import 'package:customers_service/src/customers/data/repository/customers_repository_impl.dart'
    as _i10;
import 'package:customers_service/src/customers/domain/customers_repository.dart'
    as _i9;
import 'package:customers_service/src/customers/presentation/customers_controller.dart'
    as _i12;
import 'package:customers_service/src/customers_service.dart' as _i11;
import 'package:injectable/injectable.dart' as _i1;

class CustomersServicePackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factoryParam<_i3.CustomerInfoController, _i4.CustomerInfoState,
        _i5.Customer>((
      state,
      customer,
    ) =>
        _i3.CustomerInfoController(
          state,
          customer,
          gh<_i6.AppRouter>(),
        ));
    gh.lazySingleton<_i7.CustomerRemoteDataSource>(
        () => _i7.CustomerRemoteDataSource(gh<_i8.Dio>()));
    gh.lazySingleton<_i9.CustomerRepository>(
        () => _i10.CustomerRepositoryImpl(gh<_i7.CustomerRemoteDataSource>()));
    gh.factory<_i11.CustomerService>(
        () => _i11.CustomerService(gh<_i6.AppRouter>()));
    gh.factory<_i12.CustomersController>(
        () => _i12.CustomersController(gh<_i9.CustomerRepository>()));
    gh.lazySingleton<_i13.CustomersDatabaseFactory>(
        () => _i13.CustomersDatabaseFactory(gh<_i5.AppDirectory>()));
    gh.singleton<_i14.CustomersRouter>(_i14.CustomersRouter());
  }
}
