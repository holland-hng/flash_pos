//@GeneratedMicroModule;MenuPackageModule;package:menu/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_data/core_data.dart' as _i8;
import 'package:core_dependency/core_dependency.dart' as _i6;
import 'package:core_router/core_router.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;
import 'package:menu/core/database/database.dart' as _i7;
import 'package:menu/core/router/menu_router.dart' as _i13;
import 'package:menu/features/cart/domain/cart_item.dart' as _i16;
import 'package:menu/features/cart/presentation/cart_handler.dart' as _i3;
import 'package:menu/features/category/data/repository/category_local_data_source.dart'
    as _i19;
import 'package:menu/features/category/data/repository/category_remote_data_source.dart'
    as _i5;
import 'package:menu/features/category/data/repository/category_repository_impl.dart'
    as _i21;
import 'package:menu/features/category/domain/category.dart' as _i24;
import 'package:menu/features/category/domain/category_repository.dart' as _i20;
import 'package:menu/features/category/presentation/category_controller.dart'
    as _i23;
import 'package:menu/features/category/presentation/widgets/pick_product/pick_product_handler.dart'
    as _i15;
import 'package:menu/features/menu/data/repository/menu_local_data_source.dart'
    as _i9;
import 'package:menu/features/menu/data/repository/menu_remote_data_source.dart'
    as _i10;
import 'package:menu/features/menu/data/repository/menu_repository_impl.dart'
    as _i12;
import 'package:menu/features/menu/domain/menu_repository.dart' as _i11;
import 'package:menu/features/menu/presentation/menu_controller.dart' as _i22;
import 'package:menu/features/menu/presentation/order_controller.dart' as _i14;
import 'package:menu/features/menu/presentation/widgets/main_menu_view/popup_handler.dart'
    as _i18;
import 'package:menu/features/place_order/presentation/place_order_controller.dart'
    as _i17;

class MenuPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) async {
    gh.factory<_i3.CartHandler>(() => _i3.CartHandler(gh<_i4.AppRouter>()));
    gh.lazySingleton<_i5.CategoryRemoteDataSource>(
        () => _i5.CategoryRemoteDataSource(gh<_i6.Dio>()));
    gh.lazySingleton<_i7.MenuDatabaseFactory>(
        () => _i7.MenuDatabaseFactory(gh<_i8.AppDirectory>()));
    await gh.lazySingletonAsync<_i9.MenuLocalDataSource>(
      () => _i9.MenuLocalDataSource.getInstance(gh<_i7.MenuDatabaseFactory>()),
      preResolve: true,
    );
    gh.lazySingleton<_i10.MenuRemoteDataSource>(
        () => _i10.MenuRemoteDataSource(gh<_i6.Dio>()));
    gh.lazySingleton<_i11.MenuRepository>(() => _i12.MenuRepositoryImpl(
          gh<_i10.MenuRemoteDataSource>(),
          gh<_i9.MenuLocalDataSource>(),
        ));
    gh.singleton<_i13.MenuRouter>(_i13.MenuRouter());
    gh.factory<_i14.OrderController>(() => _i14.OrderController());
    gh.factoryParam<_i15.PickProductHandler, _i16.CartItem, dynamic>((
      orderItem,
      _,
    ) =>
        _i15.PickProductHandler(orderItem));
    gh.factory<_i17.PlaceOrderController>(() => _i17.PlaceOrderController());
    gh.lazySingleton<_i18.PopupHandler>(() => _i18.PopupHandlerImpl());
    await gh.lazySingletonAsync<_i19.CategoryLocalDataSource>(
      () => _i19.CategoryLocalDataSource.getInstance(
          gh<_i7.MenuDatabaseFactory>()),
      preResolve: true,
    );
    gh.lazySingleton<_i20.CategoryRepository>(() => _i21.CategoryRepositoryImpl(
          gh<_i5.CategoryRemoteDataSource>(),
          gh<_i19.CategoryLocalDataSource>(),
        ));
    gh.factory<_i22.MenuFlashController>(() => _i22.MenuFlashController(
          gh<_i11.MenuRepository>(),
          gh<_i3.CartHandler>(),
        ));
    gh.factoryParam<_i23.CategoryController, _i24.Category, dynamic>((
      category,
      _,
    ) =>
        _i23.CategoryController(
          category,
          gh<_i20.CategoryRepository>(),
        ));
  }
}