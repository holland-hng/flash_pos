import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:orders/core/app_config/app_config.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies({GetIt? mainGetIt}) async {
  final internalGetIt = mainGetIt ?? getIt;
  final isSubmodule = mainGetIt == null;

  if (isSubmodule) {
    getIt.registerSingleton<AppConfig>(OrdersAppConfig());
    await initCoreDependencies(mainGetIt: getIt);
  }

  await internalGetIt.init();
}
