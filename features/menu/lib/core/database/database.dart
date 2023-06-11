import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:menu/features/category/data/dao/category.dart';
import 'package:menu/features/category/data/dao/category_products.dart';

@lazySingleton
class MenuDatabaseFactory extends DatabaseFactory {
  MenuDatabaseFactory(AppDirectory appDir) : super(appDir.menuFeature);

  @override
  void initialize() {
    registerAdapter<CategoryDao>(CategoryDaoAdapter());
    registerAdapter<ProductDao>(ProductDaoAdapter());
    registerAdapter<CategoryProductsDao>(CategoryProductsDaoAdapter());
    registerAdapter<ProductOptionDao>(ProductOptionDaoAdapter());
    registerAdapter<ProductOptionDetailDao>(ProductOptionDetailDaoAdapter());
  }
}
