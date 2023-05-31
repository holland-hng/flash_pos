import 'package:core_dependency/core_dependency.dart';
import 'package:menu/features/category/domain/product.dart';

class CartItem extends Equatable {
  final String id;
  final Product product;
  final int quantity;
  final String note;
  final Map<String, ProductOption> pickedDetailsMap; //ProductOption.details

  const CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.note,
    required this.pickedDetailsMap,
  });

  List<ProductOptionDetail> get pickedDetails {
    List<ProductOptionDetail> result = [];
    pickedDetailsMap.forEach((key, option) {
      if (option.details.isNotEmpty) {
        result.addAll(option.details);
      }
    });
    return result;
  }

  double get price {
    final options = pickedDetailsMap;
    double subPrice = 0;
    options.forEach((key, option) {
      for (final detail in option.details) {
        subPrice += detail.price;
      }
    });
    final result = quantity * (product.price + subPrice);
    return result;
  }

  factory CartItem.fromProduct(Product product) {
    final Map<String, ProductOption> emptyMap = {};
    for (var option in product.options) {
      if (option.mode == OptionMode.single) {
        if (option.details.isNotEmpty) {
          emptyMap[option.id] = option.clone(
            details: [option.details.first],
          );
        } else {
          emptyMap[option.id] = option.clone(details: []);
        }
      } else {
        emptyMap[option.id] = option.clone(details: []);
      }
    }
    return CartItem(
      product: product,
      quantity: 1,
      note: '',
      pickedDetailsMap: emptyMap,
      //TODO: need unique id
      id: product.id,
    );
  }

  CartItem clone({
    int? quantity,
    String? note,
    Map<String, ProductOption>? pickedDetailsMap,
  }) {
    return CartItem(
      product: product,
      quantity: quantity ?? this.quantity,
      note: note ?? this.note,
      pickedDetailsMap: pickedDetailsMap ?? this.pickedDetailsMap,
      id: id,
    );
  }

  @override
  List<Object?> get props => [
        product,
        note,
        pickedDetailsMap,
      ];
}
