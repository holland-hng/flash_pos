import 'package:core_data/core_data.dart';
part 'product_option.g.dart';

@HiveType(typeId: HiveIdentify.productOptionId)
class ProductOptionDao extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String mode;
  @HiveField(3)
  final List<ProductOptionDetailDao> details;

  ProductOptionDao({
    required this.mode,
    required this.id,
    required this.name,
    required this.details,
  });
}

@HiveType(typeId: HiveIdentify.productOptionDetailId)
class ProductOptionDetailDao extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double price;

  ProductOptionDetailDao({
    required this.id,
    required this.name,
    required this.price,
  });
}
