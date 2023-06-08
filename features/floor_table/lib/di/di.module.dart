//@GeneratedMicroModule;FloorTablePackageModule;package:floor_table/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:floor_table/core/router/floor_table_router.dart' as _i4;
import 'package:floor_table/features/floor_table/presentation/controllers/floor_controller.dart'
    as _i7;
import 'package:floor_table/features/floor_table/presentation/controllers/floor_size_calculator.dart'
    as _i3;
import 'package:floor_table/features/floor_table/presentation/controllers/furniture_creator.dart'
    as _i5;
import 'package:floor_table/features/floor_table/presentation/controllers/furniture_editor.dart'
    as _i6;
import 'package:injectable/injectable.dart' as _i1;

class FloorTablePackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.FloorSizeCalculator>(() => _i3.FloorSizeCalculatorImpl());
    gh.singleton<_i4.FloorTableRouter>(_i4.FloorTableRouter());
    gh.factory<_i5.FurnitureCreator>(() => _i5.FurnitureCreatorImpl());
    gh.factory<_i6.FurnitureEditor>(() => _i6.FurnitureEditor());
    gh.factory<_i7.FloorController>(() => _i7.FloorController(
          gh<_i3.FloorSizeCalculator>(),
          gh<_i5.FurnitureCreator>(),
          gh<_i6.FurnitureEditor>(),
        ));
  }
}
