import 'package:core_data/core_data.dart';

abstract class CategoryRepository {
  Future<List<Product>> getProducts(String category);
  List<Product> getCachedProducts(String category);
}
