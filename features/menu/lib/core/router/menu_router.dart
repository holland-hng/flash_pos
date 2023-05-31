import 'package:core_router/core_router.dart';
import 'package:flutter/foundation.dart';
import 'package:menu/features/menu/presentation/menu_screen.dart';
import 'package:menu/features/place_order/domain/order_item.dart';
import 'package:menu/features/place_order/presentation/place_order_screen.dart';

part 'menu_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class MenuRouter extends _$MenuRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MenuRoute.page),
        AutoRoute(
          page: PlaceOrderRoute.page,
          fullscreenDialog: true,
        ),
      ];
}
