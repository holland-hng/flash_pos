//@GeneratedMicroModule;OrdersPackageModule;package:orders/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_data/core_data.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;
import 'package:orders/core/database/database.dart' as _i3;
import 'package:orders/core/router/orders_router.dart' as _i5;

class OrdersPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.singleton<_i3.OrdersDatabaseFactory>(
        _i3.OrdersDatabaseFactory(gh<_i4.AppDirectory>()));
    gh.singleton<_i5.OrdersRouter>(_i5.OrdersRouter());
  }
}
