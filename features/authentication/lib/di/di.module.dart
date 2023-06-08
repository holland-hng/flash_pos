//@GeneratedMicroModule;AuthenticationPackageModule;package:authentication/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:auth_service/auth_service.dart' as _i4;
import 'package:authentication/core/router/authentication_router.dart' as _i6;
import 'package:authentication/features/login/presentation/auth_controller.dart'
    as _i3;
import 'package:core_router/core_router.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

class AuthenticationPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.AuthController>(() => _i3.AuthController(
          gh<_i4.AuthService>(),
          gh<_i5.AppRouter>(),
          gh<_i5.AppDeepLink>(),
        ));
    gh.singleton<_i6.AuthenticationRouter>(_i6.AuthenticationRouter());
  }
}
