import 'package:core_dependency/core_dependency.dart';
import 'package:menu/features/cart/domain/cart_item.dart';

class SeatOrder extends Equatable {
  final String seatName;
  final RxList<CartItem> cartItems;

  const SeatOrder({
    required this.seatName,
    required this.cartItems,
  });

  factory SeatOrder.fromName(String seatName) {
    return SeatOrder(
      seatName: seatName,
      cartItems: const <CartItem>[].obs,
    );
  }

  factory SeatOrder.fromShared() {
    return SeatOrder(
      seatName: 'Shared',
      cartItems: const <CartItem>[].obs,
    );
  }

  bool get isShared => seatName == 'Shared';

  @override
  List<Object?> get props => [seatName, cartItems];
}
