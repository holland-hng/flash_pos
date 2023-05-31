import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:menu/core/database/database.dart';

import 'package:menu/features/category/data/dao/category.dart';
import 'package:menu/features/category/domain/category.dart';

@lazySingleton
class MenuLocalDataSource {
  final Database<CategoryDao> database;

  MenuLocalDataSource(this.database);

  @preResolve
  @factoryMethod
  static Future<MenuLocalDataSource> getInstance(
      MenuDatabaseFactory databaseFactory) async {
    final database = await databaseFactory.open<CategoryDao>(name: 'menu');
    return MenuLocalDataSource(database);
  }

  void cacheCategories(List<Category> categories) {
    Map<int, CategoryDao> categoriesDao = {};
    for (var element in categories) {
      categoriesDao[int.parse(element.id)] = element.toDao();
    }
    database.putAll(categoriesDao, notify: false);
  }

  List<Category> getCategories() {
    final result = database.values.map((dao) => Category.fromDao(dao)).toList();
    return result;
  }
}
