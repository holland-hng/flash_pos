// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i5;
import 'package:customers/core/database/database.dart' as _i4;
import 'package:customers/core/router/customers_router.dart' as _i6;
import 'package:customers/features/customers/presentation/customers_controller.dart'
    as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.CustomersController>(() => _i3.CustomersController());
    gh.lazySingleton<_i4.CustomersDatabaseFactory>(
        () => _i4.CustomersDatabaseFactory(gh<_i5.AppDirectory>()));
    gh.singleton<_i6.CustomersRouter>(_i6.CustomersRouter());
    return this;
  }
}
