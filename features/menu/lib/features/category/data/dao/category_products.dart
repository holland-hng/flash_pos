import 'package:core_data/core_data.dart';
import 'product.dart';

part 'category_products.g.dart';

@HiveType(typeId: HiveIdentify.categoryProductsId)
class CategoryProductsDao extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final List<ProductDao> products;

  CategoryProductsDao(this.id, this.products);

  static const String boxName = 'category_products';
}
