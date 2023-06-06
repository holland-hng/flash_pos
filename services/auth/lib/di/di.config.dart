// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth_service/src/data/repository/auth_local_data_source.dart'
    as _i5;
import 'package:auth_service/src/data/repository/auth_remote_data_source.dart'
    as _i6;
import 'package:auth_service/src/data/repository/auth_service_impl.dart' as _i9;
import 'package:auth_service/src/data/repository/database.dart' as _i3;
import 'package:auth_service/src/domain/auth_service.dart' as _i8;
import 'package:auth_service/src/interceptor/auth_interceptor.dart' as _i10;
import 'package:core_data/core_data.dart' as _i4;
import 'package:core_dependency/core_dependency.dart' as _i7;
import 'package:core_router/core_router.dart' as _i11;
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
    gh.lazySingleton<_i3.AuthDatabaseFactory>(
        () => _i3.AuthDatabaseFactory(gh<_i4.AppDirectory>()));
    await gh.singletonAsync<_i5.AuthLocalDataSource>(
      () => _i5.AuthLocalDataSource.getInstance(
        gh<_i3.AuthDatabaseFactory>(),
        gh<_i4.AppConfig>(),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i6.AuthRemoteDataSource>(
        () => _i6.AuthRemoteDataSource(gh<_i7.Dio>()));
    gh.singleton<_i8.AuthService>(_i9.AuthServiceImpl(
      gh<_i5.AuthLocalDataSource>(),
      gh<_i6.AuthRemoteDataSource>(),
    ));
    gh.singleton<_i10.AuthInterceptor>(_i10.AuthInterceptor(
      gh<_i8.AuthService>(),
      gh<_i11.AppRouter>(),
      gh<_i7.Dio>(),
    ));
    return this;
  }
}
