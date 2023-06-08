// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth_service/auth_service.dart' as _i5;
import 'package:authentication/authentication.dart' as _i9;
import 'package:core_data/core_data.dart' as _i3;
import 'package:core_router/core_router.dart' as _i4;
import 'package:customers_service/core/router/customers_router.dart' as _i17;
import 'package:customers_service/customers_service.dart' as _i6;
import 'package:delivery/delivery.dart' as _i14;
import 'package:firebase_service/firebase_service.dart' as _i8;
import 'package:flash_staff/core/router/staff_router.dart' as _i15;
import 'package:floor_table/floor_table.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:menu/menu.dart' as _i10;
import 'package:orders/core/router/orders_router.dart' as _i16;
import 'package:orders/orders.dart' as _i12;
import 'package:setting/setting.dart' as _i13;
import 'package:subscription_service/subscription_service.dart' as _i7;

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
    await _i6.CustomersServicePackageModule().init(gh);
    await _i7.SubscriptionServicePackageModule().init(gh);
    await _i8.FirebaseServicePackageModule().init(gh);
    await _i9.AuthenticationPackageModule().init(gh);
    await _i10.MenuPackageModule().init(gh);
    await _i11.FloorTablePackageModule().init(gh);
    await _i12.OrdersPackageModule().init(gh);
    await _i13.SettingPackageModule().init(gh);
    await _i14.DeliveryPackageModule().init(gh);
    gh.singleton<_i15.StaffRouter>(_i15.StaffRouter(
      gh<_i5.AuthService>(),
      gh<_i9.AuthenticationRouter>(),
      gh<_i14.DeliveryRouter>(),
      gh<_i10.MenuRouter>(),
      gh<_i11.FloorTableRouter>(),
      gh<_i16.OrdersRouter>(),
      gh<_i13.SettingRouter>(),
      gh<_i4.AppRouter>(),
      gh<_i17.CustomersRouter>(),
      gh<_i7.SubscriptionService>(),
    ));
    return this;
  }
}
