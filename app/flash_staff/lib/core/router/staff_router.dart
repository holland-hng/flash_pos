import 'package:authentication/core/route/authentication_router.dart';
import 'package:core_router/core_router.dart';
import 'package:delivery/core/route/delivery_route.dart';
part 'staff_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class StaffRouter extends _$StaffRouter {
  final authRouter = AuthenticationRouter();
  final deliveryRouter = DeliveryRouter();

  @override
  List<AutoRoute> get routes => [
        ...authRouter.routes,
        ...deliveryRouter.routes,
      ];
  @override
  // ignore: overridden_fields
  late Map<String, PageFactory> pagesMap = {
    ...authRouter.pagesMap,
    ...deliveryRouter.pagesMap,
  };
}
