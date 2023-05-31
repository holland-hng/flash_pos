import 'package:menu/features/category/domain/category.dart';

abstract class MenuRepository {
  Future<List<Category>> getCategories();
  List<Category> getCachedCategories();
}
