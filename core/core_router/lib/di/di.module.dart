//@GeneratedMicroModule;CoreRouterPackageModule;package:core_router/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_router/src/app_deep_link.dart' as _i3;
import 'package:core_router/src/app_router.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

class CoreRouterPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.lazySingleton<_i3.AppDeepLink>(() => _i3.AppDeepLink());
    gh.singleton<_i4.AppRouter>(_i4.AppRouter());
  }
}
