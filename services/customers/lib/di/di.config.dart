// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i3;
import 'package:core_dependency/core_dependency.dart' as _i8;
import 'package:core_router/core_router.dart' as _i4;
import 'package:customers_service/core/database/database.dart' as _i13;
import 'package:customers_service/core/router/customers_router.dart' as _i14;
import 'package:customers_service/src/customer_info/customer_info_controller.dart'
    as _i5;
import 'package:customers_service/src/customer_info/customer_info_popup.dart'
    as _i6;
import 'package:customers_service/src/customers/data/data_source/customers_remote_data_source.dart'
    as _i7;
import 'package:customers_service/src/customers/data/repository/customers_repository_impl.dart'
    as _i10;
import 'package:customers_service/src/customers/domain/customers_repository.dart'
    as _i9;
import 'package:customers_service/src/customers/presentation/customers_controller.dart'
    as _i12;
import 'package:customers_service/src/customers_service.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.CoreDataPackageModule().init(gh);
    await _i4.CoreRouterPackageModule().init(gh);
    gh.factoryParam<_i5.CustomerInfoController, _i6.CustomerInfoState,
        _i3.Customer>((
      state,
      customer,
    ) =>
        _i5.CustomerInfoController(
          state,
          customer,
          gh<_i4.AppRouter>(),
        ));
    gh.lazySingleton<_i7.CustomerRemoteDataSource>(
        () => _i7.CustomerRemoteDataSource(gh<_i8.Dio>()));
    gh.lazySingleton<_i9.CustomerRepository>(
        () => _i10.CustomerRepositoryImpl(gh<_i7.CustomerRemoteDataSource>()));
    gh.factory<_i11.CustomerService>(
        () => _i11.CustomerService(gh<_i4.AppRouter>()));
    gh.factory<_i12.CustomersController>(
        () => _i12.CustomersController(gh<_i9.CustomerRepository>()));
    gh.lazySingleton<_i13.CustomersDatabaseFactory>(
        () => _i13.CustomersDatabaseFactory(gh<_i3.AppDirectory>()));
    gh.singleton<_i14.CustomersRouter>(_i14.CustomersRouter());
    return this;
  }
}
