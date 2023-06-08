import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> coreDataConfigureDependencies({
  required GetIt mainGetIt,
}) async {
  await mainGetIt.init();
}

Future<void> initCoreDependencies({required GetIt mainGetIt}) async {
  coreRouterConfigureDependencies(mainGetIt: getIt);
  await coreDataConfigureDependencies(mainGetIt: getIt);
}
