// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth_service/auth_service.dart' as _i6;
import 'package:authentication/authentication.dart' as _i10;
import 'package:core_data/core_data.dart' as _i3;
import 'package:core_router/core_router.dart' as _i4;
import 'package:customers_service/core/router/customers_router.dart' as _i18;
import 'package:customers_service/customers_service.dart' as _i7;
import 'package:delivery/delivery.dart' as _i15;
import 'package:firebase_service/firebase_service.dart' as _i5;
import 'package:flash_staff/core/router/staff_router.dart' as _i16;
import 'package:floor_table/floor_table.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:menu/menu.dart' as _i11;
import 'package:orders/core/router/orders_router.dart' as _i17;
import 'package:orders/orders.dart' as _i13;
import 'package:setting/setting.dart' as _i14;
import 'package:subscription_service/subscription_service.dart' as _i8;
import 'package:ticket_service/ticket_service.dart' as _i9;

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
    await _i5.FirebaseServicePackageModule().init(gh);
    await _i6.AuthServicePackageModule().init(gh);
    await _i7.CustomersServicePackageModule().init(gh);
    await _i8.SubscriptionServicePackageModule().init(gh);
    await _i9.TicketServicePackageModule().init(gh);
    await _i10.AuthenticationPackageModule().init(gh);
    await _i11.MenuPackageModule().init(gh);
    await _i12.FloorTablePackageModule().init(gh);
    await _i13.OrdersPackageModule().init(gh);
    await _i14.SettingPackageModule().init(gh);
    await _i15.DeliveryPackageModule().init(gh);
    gh.singleton<_i16.StaffRouter>(_i16.StaffRouter(
      gh<_i6.AuthService>(),
      gh<_i10.AuthenticationRouter>(),
      gh<_i15.DeliveryRouter>(),
      gh<_i11.MenuRouter>(),
      gh<_i12.FloorTableRouter>(),
      gh<_i17.OrdersRouter>(),
      gh<_i14.SettingRouter>(),
      gh<_i4.AppRouter>(),
      gh<_i18.CustomersRouter>(),
      gh<_i8.SubscriptionService>(),
    ));
    return this;
  }
}
