import 'package:auth_service/auth_service.dart';
import 'package:authentication/authentication.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:customers_service/core/router/customers_router.dart';
import 'package:delivery/delivery.dart';
import 'package:flash_staff/root/root_screen.dart';
import 'package:floor_table/floor_table.dart';
import 'package:menu/menu.dart';
import 'package:orders/core/router/orders_router.dart';
import 'package:setting/setting.dart';
import 'package:subscription_service/subscription_service.dart';
part 'staff_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class StaffRouter extends _$StaffRouter implements AutoRouteGuard {
  final AuthenticationRouter authRouter;
  final DeliveryRouter deliveryRouter;
  final MenuRouter menuRouter;
  final FloorTableRouter floorRouter;
  final OrdersRouter ordersRouter;
  final SettingRouter settingRouter;
  final CustomersRouter customersRouter;
  final AuthService authService;
  final AppRouter appRouter;
  final SubscriptionService subscriptionService;

  late final Subscription subscription = subscriptionService.subscription;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: RootRoute.page,
          children: [
            if (subscription.isFullService)
              AutoRoute(path: '', page: FloorTableRoute.page),
            AutoRoute(page: MenuRoute.page),
            AutoRoute(page: OrdersRoute.page),
            AutoRoute(page: DeliveryRoute.page),
            AutoRoute(page: SettingRoute.page),
          ],
        ),
        ...authRouter.routes,
      ];

  StaffRouter(
    this.authService,
    this.authRouter,
    this.deliveryRouter,
    this.menuRouter,
    this.floorRouter,
    this.ordersRouter,
    this.settingRouter,
    this.appRouter,
    this.customersRouter,
    this.subscriptionService,
  ) {
    appRouter.delegateStackRouter(this);
    pagesMap.addAll(authRouter.pagesMap);
    pagesMap.addAll(deliveryRouter.pagesMap);
    pagesMap.addAll(menuRouter.pagesMap);
    pagesMap.addAll(floorRouter.pagesMap);
    pagesMap.addAll(ordersRouter.pagesMap);
    pagesMap.addAll(settingRouter.pagesMap);
    pagesMap.addAll(customersRouter.pagesMap);
  }

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    if (authService.authenticated || resolver.route.name == LoginRoute.name) {
      resolver.next(true);
    } else {
      router.replace(const LoginRoute());
    }
  }
}
