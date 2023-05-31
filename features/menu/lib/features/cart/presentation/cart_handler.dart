import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:menu/features/cart/domain/cart_summary_value.dart';
import 'package:menu/features/cart/domain/cart_item.dart';
import 'package:menu/features/cart/domain/seat_order.dart';

@injectable
class CartHandler {
  CartHandler(this.appRouter);

  final AppRouter appRouter;

  static final SeatOrder _firstSeat = SeatOrder.fromName("Seat 1");
  final RxList<SeatOrder> rxSeatsOrder = RxList([_firstSeat]);
  final Rx<SeatOrder> rxTargetSeat = _firstSeat.obs;
  final Rx<CartSummary> rxCartSummary =
      Rx<CartSummary>(CartSummary.initialize());

  bool isSeatSelected(SeatOrder seatOrder) {
    return rxTargetSeat.value == seatOrder;
  }

  bool get isEmpty {
    return rxCartSummary.value.itemCount == 0;
  }

  bool get isSingleSeat {
    return rxSeatsOrder.length == 1;
  }

  bool isFirst(SeatOrder seatOrder) {
    return rxSeatsOrder.first == seatOrder;
  }

  void _calculatorCartValue() {
    try {
      final seatsOrder = rxSeatsOrder;
      double subTotal = 0;
      int itemsCount = 0;
      for (var seatOrder in seatsOrder) {
        for (var item in seatOrder.cartItems) {
          subTotal += item.price;
          itemsCount += item.quantity;
        }
      }
      rxCartSummary.value = CartSummary(
        itemCount: itemsCount,
        subTotal: subTotal,
        tax: subTotal * 0.1,
        total: subTotal * 1.1,
      );
    } catch (e) {
      rxCartSummary.value = CartSummary.initialize();
    }
  }

  int get seatTargetIndex {
    return rxSeatsOrder.indexOf(rxTargetSeat.value);
  }

  void addCartItem(CartItem item, {int? itemIndex, int? seatIndex}) {
    int seatTargetIndex = seatIndex ?? this.seatTargetIndex;
    try {
      final index = rxSeatsOrder[seatTargetIndex].cartItems.indexOf(item);
      final oldItem = rxSeatsOrder[seatTargetIndex].cartItems[index];
      rxSeatsOrder[seatTargetIndex].cartItems[index] = oldItem.clone(
        quantity: oldItem.quantity + item.quantity,
      );
    } catch (_) {
      final insertIndex = itemIndex ?? 0;
      rxSeatsOrder[seatTargetIndex].cartItems.insert(insertIndex, item);
    }
    _calculatorCartValue();
  }

  void removeItem(CartItem item) {
    rxSeatsOrder[seatTargetIndex].cartItems.remove(item);
    _calculatorCartValue();
  }

  void updateItem(int itemIndex, CartItem item) {
    rxSeatsOrder[seatTargetIndex].cartItems[itemIndex] = item;
    _calculatorCartValue();
  }

  void saveOrder() {
    rxSeatsOrder.clear();
    final firstSeat = SeatOrder.fromName("Seat 1");
    rxSeatsOrder.add(firstSeat);
    rxTargetSeat.value = firstSeat;
    _calculatorCartValue();
  }

  Future<void> placeOrder() async {
    // await appRouter.push(
    //   PlaceOrderRoute(
    //     orderItems:
    //         rxCartItems.map((item) => OrderItem.fromCartItem(item)).toList(),
    //   ),
    // );
  }

  void selectNumberPeople(int num) {
    final List<SeatOrder> oldTabCartItems = List.from(rxSeatsOrder);
    rxSeatsOrder.clear();
    for (int seatIndex = 0; seatIndex < num; seatIndex++) {
      try {
        rxSeatsOrder.add(oldTabCartItems[seatIndex]);
      } catch (e) {
        rxSeatsOrder.add(SeatOrder.fromName("Seat ${seatIndex + 1}"));
      }
    }
  }

  void setSeatTarget(SeatOrder seatOrder) {
    rxTargetSeat.value = seatOrder;
  }

  void onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    final movedItem =
        rxSeatsOrder[oldListIndex].cartItems.removeAt(oldItemIndex);
    addCartItem(movedItem, seatIndex: newListIndex, itemIndex: newItemIndex);
  }

  void onListReorder(int oldListIndex, int newListIndex) {
    //don't accept reorder list
  }
}
