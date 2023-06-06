// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth_service/auth_service.dart' as _i4;
import 'package:authentication/core/router/authentication_router.dart' as _i6;
import 'package:authentication/features/login/presentation/auth_controller.dart'
    as _i3;
import 'package:core_router/core_router.dart' as _i5;
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
    gh.factory<_i3.AuthController>(() => _i3.AuthController(
          gh<_i4.AuthService>(),
          gh<_i5.AppRouter>(),
          gh<_i5.AppDeepLink>(),
        ));
    gh.singleton<_i6.AuthenticationRouter>(_i6.AuthenticationRouter());
    return this;
  }
}
