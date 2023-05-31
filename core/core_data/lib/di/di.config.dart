// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_dependency/core_dependency.dart' as _i4;
import 'package:event_bus/event_bus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../src/app_directory.dart' as _i3;
import 'dio.dart' as _i6;
import 'register_module.dart' as _i7;

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
    final registerModule = _$RegisterModule();
    final dIOModule = _$DIOModule();
    await gh.factoryAsync<_i3.AppDirectory>(
      () => registerModule.appDirectory,
      preResolve: true,
    );
    gh.lazySingleton<_i4.Dio>(() => dIOModule.dio());
    gh.lazySingleton<_i5.EventBus>(() => registerModule.eventBus);
    return this;
  }
}

class _$DIOModule extends _i6.DIOModule {}

class _$RegisterModule extends _i7.RegisterModule {}
