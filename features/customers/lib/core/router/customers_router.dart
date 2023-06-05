import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:customers/features/customers/presentation/customers_screen.dart';

part 'customers_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class CustomersRouter extends _$CustomersRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CustomersRoute.page),
      ];
}
