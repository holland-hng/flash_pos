import 'package:core_router/core_router.dart';
import '/features/progress/delivery_progress_screen.dart';
import '/features/method/delivery_method_screen.dart';

part 'delivery_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class DeliveryRouter extends _$DeliveryRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DeliveryMethodRoute.page),
        AutoRoute(page: DeliveryProgressRoute.page),
      ];
}
