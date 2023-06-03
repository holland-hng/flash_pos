import 'package:core_data/core_data.dart';
import 'product_option.dart';

part 'product.g.dart';

@HiveType(typeId: HiveIdentify.productId)
class ProductDao extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String thumb;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final List<ProductOptionDao> options;

  ProductDao({
    required this.id,
    required this.name,
    required this.thumb,
    required this.price,
    required this.options,
  });
}
