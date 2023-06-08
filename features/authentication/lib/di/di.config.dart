// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth_service/auth_service.dart' as _i5;
import 'package:authentication/core/router/authentication_router.dart' as _i7;
import 'package:authentication/features/login/presentation/auth_controller.dart'
    as _i6;
import 'package:core_data/core_data.dart' as _i3;
import 'package:core_router/core_router.dart' as _i4;
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
    await _i5.AuthServicePackageModule().init(gh);
    gh.factory<_i6.AuthController>(() => _i6.AuthController(
          gh<_i5.AuthService>(),
          gh<_i4.AppRouter>(),
          gh<_i4.AppDeepLink>(),
        ));
    gh.singleton<_i7.AuthenticationRouter>(_i7.AuthenticationRouter());
    return this;
  }
}
