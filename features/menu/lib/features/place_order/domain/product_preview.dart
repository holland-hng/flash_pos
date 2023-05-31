import 'package:core_dependency/core_dependency.dart';
import 'package:menu/features/category/domain/product.dart';

class ProductPreview extends Equatable {
  final String id;
  final String name;
  final String thumb;

  const ProductPreview({
    required this.id,
    required this.name,
    required this.thumb,
  });

  @override
  List<Object?> get props => [id, name, thumb];

  factory ProductPreview.fromProduct(Product product) {
    return ProductPreview(
      id: product.id,
      name: product.name,
      thumb: product.thumb,
    );
  }
}
