import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:delivery/features/delivery/presentation/delivery_screen.dart';
import '../../features/progress/presentation/delivery_progress_screen.dart';
import '../../features/method/presentation/delivery_method_screen.dart';

part 'delivery_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class DeliveryRouter extends _$DeliveryRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DeliveryRoute.page),
        AutoRoute(page: DeliveryMethodRoute.page),
        AutoRoute(page: DeliveryProgressRoute.page),
      ];
}
