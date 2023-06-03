// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authentication/core/database/database.dart' as _i3;
import 'package:authentication/features/auth/auth_guard.dart' as _i8;
import 'package:authentication/features/auth/auth_local_data_source.dart'
    as _i5;
import 'package:authentication/features/auth/auth_remote_data_source.dart'
    as _i6;
import 'package:authentication/features/auth/auth_service.dart' as _i7;
import 'package:core_data/core_data.dart' as _i4;
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
    await gh.singletonAsync<_i3.AuthDatabaseFactory>(
      () => _i3.AuthDatabaseFactory.getInstance(gh<_i4.AppDirectory>()),
      preResolve: true,
    );
    await gh.singletonAsync<_i5.AuthLocalDataSource>(
      () => _i5.AuthLocalDataSource.getInstance(
        gh<_i3.AuthDatabaseFactory>(),
        gh<_i4.AppConfig>(),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i6.AuthRemoteDataSource>(
        () => _i6.AuthRemoteDataSource());
    gh.singleton<_i7.AuthService>(_i7.AuthService(
      gh<_i5.AuthLocalDataSource>(),
      gh<_i6.AuthRemoteDataSource>(),
    ));
    gh.singleton<_i8.AuthGuard>(_i8.AuthGuard(gh<_i7.AuthService>()));
    return this;
  }
}
