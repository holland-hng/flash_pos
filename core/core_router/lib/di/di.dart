import 'package:core_dependency/core_dependency.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void coreRouterConfigureDependencies({
  required GetIt mainGetIt,
}) async {
  mainGetIt.init();
}
