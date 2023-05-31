import 'package:core_router/core_router.dart';
import '/features/place_order/place_order_screen.dart';
import '../../features/floor_table/presentation/floor_table_screen.dart';

part 'floor_table_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class FloorTableRouter extends _$FloorTableRouter with FloorTableRouterMixin {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: FloorTableRoute.page),
        placeOrder,
      ];
}

mixin FloorTableRouterMixin {
  final floorTable = AutoRoute(path: 'floor-table', page: FloorTableRoute.page);
  final placeOrder = AutoRoute(path: 'place-table', page: PlaceOrderRoute.page);
}
