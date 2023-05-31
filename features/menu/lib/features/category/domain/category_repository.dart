import 'package:menu/features/category/domain/product.dart';

abstract class CategoryRepository {
  Future<List<Product>> getProducts(String category);
  List<Product> getCachedProducts(String category);
}
