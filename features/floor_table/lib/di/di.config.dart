// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/floor_table/presentation/controllers/floor_controller.dart'
    as _i6;
import '../features/floor_table/presentation/controllers/floor_size_calculator.dart'
    as _i3;
import '../features/floor_table/presentation/controllers/furniture_creator.dart'
    as _i4;
import '../features/floor_table/presentation/controllers/furniture_editor.dart'
    as _i5;

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
    gh.factory<_i3.FloorSizeCalculator>(() => _i3.FloorSizeCalculatorImpl());
    gh.factory<_i4.FurnitureCreator>(() => _i4.FurnitureCreatorImpl());
    gh.factory<_i5.FurnitureEditor>(() => _i5.FurnitureEditor());
    gh.factory<_i6.FloorController>(() => _i6.FloorController(
          gh<_i3.FloorSizeCalculator>(),
          gh<_i4.FurnitureCreator>(),
          gh<_i5.FurnitureEditor>(),
        ));
    return this;
  }
}
