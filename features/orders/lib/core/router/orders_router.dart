import 'package:core_router/core_router.dart';
import 'package:orders/features/place_order/presentation/place_order_screen.dart';

import '../../features/orders/presentation/orders_screen.dart';

part 'orders_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class OrdersRouter extends _$OrdersRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OrdersRoute.page),
        AutoRoute(page: PlaceOrderRoute.page),
      ];
}
