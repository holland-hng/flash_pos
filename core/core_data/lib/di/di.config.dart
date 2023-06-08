// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/di/module.dart' as _i9;
import 'package:core_data/src/app_config/app_config.dart' as _i7;
import 'package:core_data/src/app_connectivity/app_connectivity.dart' as _i3;
import 'package:core_data/src/app_directory/app_directory.dart' as _i4;
import 'package:core_data/src/environment/environment.dart' as _i6;
import 'package:core_dependency/core_dependency.dart' as _i8;
import 'package:event_bus/event_bus.dart' as _i5;
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
    gh.singleton<_i3.AppConnectivity>(_i3.AppConnectivity());
    await gh.factoryAsync<_i4.AppDirectory>(
      () => dIModule.appDirectory,
      preResolve: true,
    );
    gh.lazySingleton<_i5.EventBus>(() => dIModule.eventBus);
    gh.singleton<_i6.FlashEnvironment>(dIModule.flashEnvironment);
    gh.singleton<_i7.AppConfig>(dIModule.appConfig(gh<_i6.FlashEnvironment>()));
    gh.lazySingleton<_i8.Dio>(() => dIModule.dio(gh<_i7.AppConfig>()));
    return this;
  }
}

class _$DIModule extends _i9.DIModule {}
