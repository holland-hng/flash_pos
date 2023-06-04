import 'package:authentication/authentication.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:delivery/delivery.dart';
import 'package:floor_table/floor_table.dart';
import '/features/root/presentation/root_screen.dart';
import '/features/dashboard/presentation/dash_board_screen.dart';
part 'manager_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class ManagerRouter extends _$ManagerRouter {
  final AuthenticationRouter authRouter;
  final DeliveryRouter deliveryRouter;
  final FloorTableRouter floorTableRouter;
  final AppRouter appRouter;

  ManagerRouter(
    this.authRouter,
    this.deliveryRouter,
    this.floorTableRouter,
    this.appRouter,
  ) {
    appRouter.delegateStackRouter(this);
    pagesMap.addAll(authRouter.pagesMap);
    pagesMap.addAll(deliveryRouter.pagesMap);
    pagesMap.addAll(floorTableRouter.pagesMap);
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: RootRoute.page,
          children: [
            AutoRoute(path: '', page: DashBoardRoute.page),
            AutoRoute(page: FloorTableRoute.page),
          ],
        ),
        ...authRouter.routes,
        ...deliveryRouter.routes,
      ];
}
