// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i3;
import 'package:core_dependency/core_dependency.dart' as _i8;
import 'package:core_router/core_router.dart' as _i4;
import 'package:firebase_service/firebase_service.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:menu/core/database/database.dart' as _i9;
import 'package:menu/core/router/menu_router.dart' as _i14;
import 'package:menu/features/cart/domain/cart_item.dart' as _i17;
import 'package:menu/features/cart/presentation/cart_handler.dart' as _i6;
import 'package:menu/features/category/data/repository/category_local_data_source.dart'
    as _i20;
import 'package:menu/features/category/data/repository/category_remote_data_source.dart'
    as _i7;
import 'package:menu/features/category/data/repository/category_repository_impl.dart'
    as _i22;
import 'package:menu/features/category/domain/category.dart' as _i25;
import 'package:menu/features/category/domain/category_repository.dart' as _i21;
import 'package:menu/features/category/presentation/category_controller.dart'
    as _i24;
import 'package:menu/features/category/presentation/widgets/pick_product/pick_product_handler.dart'
    as _i16;
import 'package:menu/features/menu/data/repository/menu_local_data_source.dart'
    as _i10;
import 'package:menu/features/menu/data/repository/menu_remote_data_source.dart'
    as _i11;
import 'package:menu/features/menu/data/repository/menu_repository_impl.dart'
    as _i13;
import 'package:menu/features/menu/domain/menu_repository.dart' as _i12;
import 'package:menu/features/menu/presentation/menu_controller.dart' as _i23;
import 'package:menu/features/menu/presentation/order_controller.dart' as _i15;
import 'package:menu/features/menu/presentation/widgets/main_menu_view/popup_handler.dart'
    as _i19;
import 'package:menu/features/place_order/presentation/place_order_controller.dart'
    as _i18;

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
    gh.factory<_i6.CartHandler>(() => _i6.CartHandler(gh<_i4.AppRouter>()));
    gh.lazySingleton<_i7.CategoryRemoteDataSource>(
        () => _i7.CategoryRemoteDataSource(gh<_i8.Dio>()));
    gh.lazySingleton<_i9.MenuDatabaseFactory>(
        () => _i9.MenuDatabaseFactory(gh<_i3.AppDirectory>()));
    await gh.lazySingletonAsync<_i10.MenuLocalDataSource>(
      () => _i10.MenuLocalDataSource.getInstance(gh<_i9.MenuDatabaseFactory>()),
      preResolve: true,
    );
    gh.lazySingleton<_i11.MenuRemoteDataSource>(
        () => _i11.MenuRemoteDataSource(gh<_i8.Dio>()));
    gh.lazySingleton<_i12.MenuRepository>(() => _i13.MenuRepositoryImpl(
          gh<_i11.MenuRemoteDataSource>(),
          gh<_i10.MenuLocalDataSource>(),
        ));
    gh.singleton<_i14.MenuRouter>(_i14.MenuRouter());
    gh.factory<_i15.OrderController>(() => _i15.OrderController());
    gh.factoryParam<_i16.PickProductHandler, _i17.CartItem, dynamic>((
      orderItem,
      _,
    ) =>
        _i16.PickProductHandler(orderItem));
    gh.factory<_i18.PlaceOrderController>(() => _i18.PlaceOrderController());
    gh.lazySingleton<_i19.PopupHandler>(() => _i19.PopupHandlerImpl());
    await gh.lazySingletonAsync<_i20.CategoryLocalDataSource>(
      () => _i20.CategoryLocalDataSource.getInstance(
          gh<_i9.MenuDatabaseFactory>()),
      preResolve: true,
    );
    gh.lazySingleton<_i21.CategoryRepository>(() => _i22.CategoryRepositoryImpl(
          gh<_i7.CategoryRemoteDataSource>(),
          gh<_i20.CategoryLocalDataSource>(),
        ));
    gh.factory<_i23.MenuFlashController>(() => _i23.MenuFlashController(
          gh<_i12.MenuRepository>(),
          gh<_i6.CartHandler>(),
        ));
    gh.factoryParam<_i24.CategoryController, _i25.Category, dynamic>((
      category,
      _,
    ) =>
        _i24.CategoryController(
          category,
          gh<_i21.CategoryRepository>(),
        ));
    return this;
  }
}
