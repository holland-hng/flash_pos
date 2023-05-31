// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_router/core_router.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/dashboard/presentation/dash_board_controller.dart' as _i5;
import '../features/dashboard/presentation/widgets/chart_view_factory.dart'
    as _i4;
import 'module.dart' as _i6;

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
    final module = _$Module();
    gh.lazySingleton<_i3.AppRouter>(() => module.appRouter);
    gh.factory<_i4.ChartViewFactory>(() => _i4.ChartViewFactory());
    gh.factory<_i5.DashBoardController>(() => _i5.DashBoardController());
    return this;
  }
}

class _$Module extends _i6.Module {}
