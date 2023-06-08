//@GeneratedMicroModule;CustomersServicePackageModule;package:customers_service/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_data/core_data.dart' as _i9;
import 'package:core_dependency/core_dependency.dart' as _i4;
import 'package:customers_service/core/database/database.dart' as _i8;
import 'package:customers_service/core/router/customers_router.dart' as _i10;
import 'package:customers_service/features/customers/data/data_source/customers_remote_data_source.dart'
    as _i3;
import 'package:customers_service/features/customers/data/repository/customers_repository_impl.dart'
    as _i6;
import 'package:customers_service/features/customers/domain/customers_repository.dart'
    as _i5;
import 'package:customers_service/features/customers/presentation/customers_controller.dart'
    as _i7;
import 'package:injectable/injectable.dart' as _i1;

class CustomersServicePackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.lazySingleton<_i3.CustomerRemoteDataSource>(
        () => _i3.CustomerRemoteDataSource(gh<_i4.Dio>()));
    gh.lazySingleton<_i5.CustomerRepository>(
        () => _i6.CustomerRepositoryImpl(gh<_i3.CustomerRemoteDataSource>()));
    gh.factory<_i7.CustomersController>(
        () => _i7.CustomersController(gh<_i5.CustomerRepository>()));
    gh.lazySingleton<_i8.CustomersDatabaseFactory>(
        () => _i8.CustomersDatabaseFactory(gh<_i9.AppDirectory>()));
    gh.singleton<_i10.CustomersRouter>(_i10.CustomersRouter());
  }
}
