import 'package:menu/features/category/domain/category.dart';
import 'package:menu/features/menu/data/repository/menu_repository_impl.dart';

/// [MenuRepositoryImpl]
abstract class MenuRepository {
  Future<List<Category>> getCategories();
  List<Category> getCachedCategories();
}
