import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:menu/features/category/data/dao/category.dart';
import 'package:menu/features/category/data/dao/category_products.dart';
import 'package:menu/features/category/data/dao/product.dart';

import '../../features/category/data/dao/product_option.dart';

@singleton
class MenuDatabaseFactory extends DatabaseFactory {
  MenuDatabaseFactory(AppDirectory appDir)
      : super(
          databasePath: appDir.menuFeature,
        );

  @preResolve
  @factoryMethod
  static Future<MenuDatabaseFactory> getInstance(AppDirectory appDir) async {
    final menuDatabase = MenuDatabaseFactory(appDir);
    return menuDatabase;
  }

  @override
  void initialize() {
    registerAdapter<CategoryDao>(CategoryDaoAdapter());
    registerAdapter<ProductDao>(ProductDaoAdapter());
    registerAdapter<CategoryProductsDao>(CategoryProductsDaoAdapter());
    registerAdapter<ProductOptionDao>(ProductOptionDaoAdapter());
    registerAdapter<ProductOptionDetailDao>(ProductOptionDetailDaoAdapter());
  }
}

class HiveIdentify {
  static const int categoryId = 0;
  static const int productId = 1;
  static const int categoryProductsId = 2;
  static const int productOptionId = 3;
  static const int productOptionDetailId = 4;
}
