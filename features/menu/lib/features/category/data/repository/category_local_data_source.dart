import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:menu/core/database/database.dart';
import 'package:menu/features/category/data/dao/category_products.dart';

@lazySingleton
class CategoryLocalDataSource {
  final Database<CategoryProductsDao> database;

  CategoryLocalDataSource(this.database);

  @preResolve
  @factoryMethod
  static Future<CategoryLocalDataSource> getInstance(
    MenuDatabaseFactory databaseFactory,
  ) async {
    final database = await databaseFactory.open<CategoryProductsDao>(
      name: CategoryProductsDao.boxName,
    );
    return CategoryLocalDataSource(database);
  }

  List<ProductDao> getProducts(String categoryId) {
    List<ProductDao> result;
    final categoryProductsDao = database.get(categoryId);
    if (categoryProductsDao != null) {
      result = categoryProductsDao.products;
    } else {
      result = [];
    }
    return result;
  }

  void cacheProducts(CategoryProductsDao categoryProducts) {
    database.put(categoryProducts.id, categoryProducts);
  }
}
