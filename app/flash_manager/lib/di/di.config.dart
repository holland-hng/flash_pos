// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authentication/authentication.dart' as _i6;
import 'package:core_router/core_router.dart' as _i9;
import 'package:delivery/delivery.dart' as _i7;
import 'package:floor_table/floor_table.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/router/manager_router.dart' as _i5;
import '../features/dashboard/presentation/dash_board_controller.dart' as _i4;
import '../features/dashboard/presentation/widgets/chart_view_factory.dart'
    as _i3;

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
    gh.factory<_i3.ChartViewFactory>(() => _i3.ChartViewFactory());
    gh.factory<_i4.DashBoardController>(() => _i4.DashBoardController());
    gh.singleton<_i5.ManagerRouter>(_i5.ManagerRouter(
      gh<_i6.AuthenticationRouter>(),
      gh<_i7.DeliveryRouter>(),
      gh<_i8.FloorTableRouter>(),
      gh<_i9.AppRouter>(),
    ));
    return this;
  }
}
