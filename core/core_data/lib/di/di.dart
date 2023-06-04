import 'package:core_data/core_data.dart';
import 'package:core_data/src/app_config/dev_app_config.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> coreDataConfigureDependencies({
  required GetIt mainGetIt,
}) async {
  if (mainGetIt.isRegistered<AppConfig>()) {
    //need not register again
  } else {
    mainGetIt.registerSingleton<AppConfig>(DevAppConfig());
  }
  await mainGetIt.init();
}

Future<void> initCoreDependencies({required GetIt mainGetIt}) async {
  coreRouterConfigureDependencies(mainGetIt: getIt);
  await coreDataConfigureDependencies(mainGetIt: getIt);
}
