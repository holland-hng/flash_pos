import 'package:core_data/src/database/hive_identify.dart';
import 'package:core_data/src/product/data/dao/product_option.dart';
import 'package:hive_flutter/adapters.dart';

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
