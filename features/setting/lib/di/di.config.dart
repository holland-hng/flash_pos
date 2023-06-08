// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i3;
import 'package:core_router/core_router.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:setting/core/database/database.dart' as _i5;
import 'package:setting/core/router/setting_router.dart' as _i7;
import 'package:setting/features/setting/presentation/setting_controller.dart'
    as _i6;

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
    gh.lazySingleton<_i5.MenuDatabaseFactory>(
        () => _i5.MenuDatabaseFactory(gh<_i3.AppDirectory>()));
    gh.factory<_i6.SettingController>(() => _i6.SettingController(
          gh<_i4.AppRouter>(),
          gh<_i4.AppDeepLink>(),
        ));
    gh.singleton<_i7.SettingRouter>(_i7.SettingRouter());
    return this;
  }
}
