// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authentication/authentication.dart' as _i5;
import 'package:core_data/core_data.dart' as _i4;
import 'package:core_router/core_router.dart' as _i11;
import 'package:delivery/delivery.dart' as _i6;
import 'package:flash_staff/core/router/staff_router.dart' as _i3;
import 'package:floor_table/floor_table.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:menu/menu.dart' as _i7;
import 'package:orders/core/router/orders_router.dart' as _i9;
import 'package:setting/setting.dart' as _i10;

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
    gh.singleton<_i3.StaffRouter>(_i3.StaffRouter(
      gh<_i4.AuthService>(),
      gh<_i5.AuthenticationRouter>(),
      gh<_i6.DeliveryRouter>(),
      gh<_i7.MenuRouter>(),
      gh<_i8.FloorTableRouter>(),
      gh<_i9.OrdersRouter>(),
      gh<_i10.SettingRouter>(),
      gh<_i11.AppRouter>(),
    ));
    return this;
  }
}
