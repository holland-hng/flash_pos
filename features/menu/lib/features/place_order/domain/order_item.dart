import 'package:core_dependency/core_dependency.dart';
import 'package:menu/features/cart/domain/cart_item.dart';
import 'package:menu/features/category/domain/product.dart';
import 'product_preview.dart';

class OrderItem extends Equatable {
  final String id;
  final ProductPreview product;
  final int quantity;
  final String note;
  final List<ProductOptionDetail> optionDetails;

  const OrderItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.note,
    required this.optionDetails,
  });

  @override
  List<Object?> get props => [id, product, quantity, note, optionDetails];

  factory OrderItem.fromCartItem(CartItem item) {
    List<ProductOptionDetail> optionDetails = [];
    item.pickedDetailsMap.forEach(
      (key, option) {
        for (var detail in option.details) {
          optionDetails.add(detail);
        }
      },
    );
    return OrderItem(
      id: item.id,
      product: ProductPreview.fromProduct(item.product),
      quantity: item.quantity,
      note: item.note,
      optionDetails: optionDetails,
    );
  }
}
