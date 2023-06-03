import 'package:authentication/authentication.dart';
import 'package:core_router/core_router.dart';
import 'package:delivery/core/route/delivery_route.dart';
import 'package:flash_staff/di/di.dart';
import 'package:flash_staff/root/root_screen.dart';
import 'package:floor_table/floor_table.dart';
import 'package:menu/menu.dart';
import 'package:orders/core/router/orders_router.dart';
import 'package:setting/setting.dart';
part 'staff_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class StaffRouter extends _$StaffRouter implements AutoRouteGuard {
  final authRouter = AuthenticationRouter();
  final deliveryRouter = DeliveryRouter();
  final menuRouter = MenuRouter();
  final floorRouter = FloorTableRouter();
  final ordersRouter = OrdersRouter();
  final settingRouter = SettingRouter();
  final AuthGuard authGuard = getIt<AuthGuard>();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: RootRoute.page,
          children: [
            AutoRoute(path: '', page: FloorTableRoute.page),
            AutoRoute(page: MenuRoute.page),
            AutoRoute(page: OrdersRoute.page),
            AutoRoute(page: DeliveryRoute.page),
            AutoRoute(page: SettingRoute.page),
          ],
        ),
        ...authRouter.routes,
        // ...deliveryRouter.routes,
        // ...menuRouter.routes,
        // ...floorRouter.routes,
        // ...ordersRouter.routes,
        // ...settingRouter.routes,
      ];

  StaffRouter() {
    pagesMap.addAll(authRouter.pagesMap);
    pagesMap.addAll(deliveryRouter.pagesMap);
    pagesMap.addAll(menuRouter.pagesMap);
    pagesMap.addAll(floorRouter.pagesMap);
    pagesMap.addAll(ordersRouter.pagesMap);
    pagesMap.addAll(settingRouter.pagesMap);
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    authGuard.onNavigation(resolver, router);
  }
}
