// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i5;
import 'package:core_data/di/module.dart' as _i14;
import 'package:core_data/src/app_config/app_config.dart' as _i8;
import 'package:core_data/src/app_directory.dart' as _i3;
import 'package:core_data/src/auth/data/repository/auth_local_data_source.dart'
    as _i6;
import 'package:core_data/src/auth/data/repository/auth_remote_data_source.dart'
    as _i10;
import 'package:core_data/src/auth/data/repository/auth_service_impl.dart'
    as _i11;
import 'package:core_data/src/auth/data/repository/database.dart' as _i4;
import 'package:core_data/src/auth/interceptor/auth_interceptor.dart' as _i12;
import 'package:core_dependency/core_dependency.dart' as _i7;
import 'package:core_router/core_router.dart' as _i13;
import 'package:event_bus/event_bus.dart' as _i9;
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
    final dIModule = _$DIModule();
    await gh.factoryAsync<_i3.AppDirectory>(
      () => dIModule.appDirectory,
      preResolve: true,
    );
    gh.lazySingleton<_i4.AuthDatabaseFactory>(
        () => _i4.AuthDatabaseFactory(gh<_i5.AppDirectory>()));
    await gh.singletonAsync<_i6.AuthLocalDataSource>(
      () => _i6.AuthLocalDataSource.getInstance(
        gh<_i4.AuthDatabaseFactory>(),
        gh<_i5.AppConfig>(),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i7.Dio>(() => dIModule.dio(gh<_i8.AppConfig>()));
    gh.lazySingleton<_i9.EventBus>(() => dIModule.eventBus);
    gh.lazySingleton<_i10.AuthRemoteDataSource>(
        () => _i10.AuthRemoteDataSource(gh<_i7.Dio>()));
    gh.singleton<_i5.AuthService>(_i11.AuthServiceImpl(
      gh<_i6.AuthLocalDataSource>(),
      gh<_i10.AuthRemoteDataSource>(),
    ));
    gh.singleton<_i12.AuthInterceptor>(_i12.AuthInterceptor(
      gh<_i5.AuthService>(),
      gh<_i13.AppRouter>(),
      gh<_i7.Dio>(),
    ));
    return this;
  }
}

class _$DIModule extends _i14.DIModule {}
