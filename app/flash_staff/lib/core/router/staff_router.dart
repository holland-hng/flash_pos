import 'package:authentication/core/route/authentication_router.dart';
import 'package:core_router/core_router.dart';
import 'package:delivery/core/route/delivery_route.dart';
import 'package:flash_staff/root/root_screen.dart';
import 'package:floor_table/core/route/floor_table_router.dart';
import 'package:menu/menu.dart';
part 'staff_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class StaffRouter extends _$StaffRouter {
  final authRouter = AuthenticationRouter();
  final deliveryRouter = DeliveryRouter();
  final menuRouter = MenuRouter();
  final floorRouter = FloorTableRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: RootRoute.page,
          children: [
            AutoRoute(path: '', page: FloorTableRoute.page),
            AutoRoute(page: MenuRoute.page),
          ],
        ),
        ...authRouter.routes,
        ...deliveryRouter.routes,
        ...menuRouter.routes,
        ...floorRouter.routes,
      ];

  StaffRouter() {
    pagesMap.addAll(authRouter.pagesMap);
    pagesMap.addAll(deliveryRouter.pagesMap);
    pagesMap.addAll(menuRouter.pagesMap);
    pagesMap.addAll(floorRouter.pagesMap);
  }
}
