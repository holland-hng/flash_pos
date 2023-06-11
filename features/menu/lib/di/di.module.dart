//@GeneratedMicroModule;MenuPackageModule;package:menu/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_data/core_data.dart' as _i6;
import 'package:core_dependency/core_dependency.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;
import 'package:menu/core/database/database.dart' as _i5;
import 'package:menu/core/router/menu_router.dart' as _i11;
import 'package:menu/features/category/data/repository/category_local_data_source.dart'
    as _i12;
import 'package:menu/features/category/data/repository/category_remote_data_source.dart'
    as _i3;
import 'package:menu/features/category/data/repository/category_repository_impl.dart'
    as _i14;
import 'package:menu/features/category/domain/category.dart' as _i18;
import 'package:menu/features/category/domain/category_repository.dart' as _i13;
import 'package:menu/features/category/presentation/category_controller.dart'
    as _i17;
import 'package:menu/features/menu/data/repository/menu_local_data_source.dart'
    as _i7;
import 'package:menu/features/menu/data/repository/menu_remote_data_source.dart'
    as _i8;
import 'package:menu/features/menu/data/repository/menu_repository_impl.dart'
    as _i10;
import 'package:menu/features/menu/domain/menu_repository.dart' as _i9;
import 'package:menu/features/menu/presentation/menu_controller.dart' as _i15;
import 'package:ticket_service/ticket_service.dart' as _i16;

class MenuPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) async {
    gh.lazySingleton<_i3.CategoryRemoteDataSource>(
        () => _i3.CategoryRemoteDataSource(gh<_i4.Dio>()));
    gh.lazySingleton<_i5.MenuDatabaseFactory>(
        () => _i5.MenuDatabaseFactory(gh<_i6.AppDirectory>()));
    await gh.lazySingletonAsync<_i7.MenuLocalDataSource>(
      () => _i7.MenuLocalDataSource.getInstance(gh<_i5.MenuDatabaseFactory>()),
      preResolve: true,
    );
    gh.lazySingleton<_i8.MenuRemoteDataSource>(
        () => _i8.MenuRemoteDataSource(gh<_i4.Dio>()));
    gh.lazySingleton<_i9.MenuRepository>(() => _i10.MenuRepositoryImpl(
          gh<_i8.MenuRemoteDataSource>(),
          gh<_i7.MenuLocalDataSource>(),
        ));
    gh.singleton<_i11.MenuRouter>(_i11.MenuRouter());
    await gh.lazySingletonAsync<_i12.CategoryLocalDataSource>(
      () => _i12.CategoryLocalDataSource.getInstance(
          gh<_i5.MenuDatabaseFactory>()),
      preResolve: true,
    );
    gh.lazySingleton<_i13.CategoryRepository>(() => _i14.CategoryRepositoryImpl(
          gh<_i3.CategoryRemoteDataSource>(),
          gh<_i12.CategoryLocalDataSource>(),
        ));
    gh.factory<_i15.MenuFlashController>(() => _i15.MenuFlashController(
          gh<_i9.MenuRepository>(),
          gh<_i16.TicketHandler>(),
        ));
    gh.factoryParam<_i17.CategoryController, _i18.Category, dynamic>((
      category,
      _,
    ) =>
        _i17.CategoryController(
          category,
          gh<_i13.CategoryRepository>(),
        ));
  }
}
