import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:orders/core/app_config/app_config.dart';
import 'package:orders/core/router/orders_router.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> ordersFeatureConfigureDependencies({GetIt? mainGetIt}) async {
  final internalGetIt = mainGetIt ?? getIt;
  final isSubmodule = mainGetIt == null;

  if (isSubmodule) {
    List<Future> coreDependencies = [
      coreDataConfigureDependencies(mainGetIt: internalGetIt),
      registerRouter(),
    ];
    await Future.wait(coreDependencies);
    registerAppConfig();
  }

  await internalGetIt.init();
}

Future<void> registerRouter() async {
  final managerRouter = OrdersRouter();
  final appRouter = AppRouter(managerRouter);
  getIt.registerSingleton<AppRouter>(appRouter);
}

void registerAppConfig() {
  getIt.registerSingleton<AppConfig>(OrdersAppConfig(getIt<Dio>()));
}
