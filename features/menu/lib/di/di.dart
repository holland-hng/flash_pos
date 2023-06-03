import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:menu/core/app_config/menu_app_config.dart';
import 'package:menu/core/router/menu_router.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> menuFeatureConfigureDependencies({GetIt? mainGetIt}) async {
  final internalGetIt = mainGetIt ?? getIt;
  final isSubmodule = mainGetIt == null;

  if (isSubmodule) {
    getIt.registerSingleton<AppConfig>(MenuAppConfig());

    List<Future> coreDependencies = [
      coreDataConfigureDependencies(mainGetIt: internalGetIt),
      registerRouter(),
    ];
    await Future.wait(coreDependencies);
  }

  await internalGetIt.init();
}

Future<void> registerRouter() async {
  final managerRouter = MenuRouter();
  final appRouter = AppRouter(managerRouter);
  getIt.registerSingleton<AppRouter>(appRouter);
}
