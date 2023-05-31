import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:menu/features/cart/domain/cart_summary_value.dart';
import 'package:menu/features/cart/domain/cart_item.dart';

typedef CartTab = List<CartItem>;

@injectable
class CartHandler {
  CartHandler(this.appRouter);

  final AppRouter appRouter;
  final RxList<CartTab> rxCartTabs = RxList([[]]);

  int Function()? getCurrentTabIndex;

  List<String> get titleTabs {
    List<String> result = [];
    for (int index = 0; index < rxCartTabs.length; index++) {
      result.add('Person ${index + 1}');
    }

    return result;
  }

  late int currentTab = 0;
  late RxCombine<CartSummaryValue> rxOrderSummary = RxCombine<CartSummaryValue>(
    rxs: [rxCartTabs],
    combiner: (rxs) {
      try {
        final cartTab = rxs.first as RxList<CartTab>;
        double subTotal = 0;
        int itemsCount = 0;
        for (var orderItems in cartTab) {
          for (var item in orderItems) {
            subTotal += item.price;
            itemsCount += item.quantity;
          }
        }
        return CartSummaryValue(
          itemCount: itemsCount,
          subTotal: subTotal,
          tax: subTotal * 0.1,
          total: subTotal * 1.1,
        );
      } catch (e) {
        throw CartSummaryValue.initialize();
      }
    },
  );

  void addOrderItem(CartItem item) {
    final tabIndex = getCurrentTabIndex?.call() ?? 0;

    try {
      final index = rxCartTabs[tabIndex].indexOf(item);
      final oldItem = rxCartTabs[tabIndex][index];
      rxCartTabs[tabIndex][index] = oldItem.clone(
        quantity: oldItem.quantity + item.quantity,
      );
    } catch (_) {
      rxCartTabs[tabIndex] = [item] + rxCartTabs[tabIndex];
    }
  }

  void removeItem(CartItem item) {
    final tabIndex = getCurrentTabIndex?.call() ?? 0;
    rxCartTabs[tabIndex].remove(item);
  }

  void updateItem(int index, CartItem item) {
    final tabIndex = getCurrentTabIndex?.call() ?? 0;
    rxCartTabs[tabIndex][index] = item;
  }

  void saveOrder() {
    rxCartTabs.clear();
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
    final List<List<CartItem>> oldTabCartItems = List.from(rxCartTabs);
    rxCartTabs.clear();
    for (int index = 0; index < num; index++) {
      try {
        rxCartTabs.add(oldTabCartItems[index]);
      } catch (e) {
        rxCartTabs.add([]);
      }
    }
  }
}
