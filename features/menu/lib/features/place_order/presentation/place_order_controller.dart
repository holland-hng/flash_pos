import 'package:core_dependency/core_dependency.dart';
import 'package:menu/features/place_order/domain/order_item.dart';

@injectable
class PlaceOrderController {
  final RxList<OrderItem> rxOrderItems = RxList();

  void initialize(List<OrderItem> items) {
    rxOrderItems.addAll(items);
  }
}
