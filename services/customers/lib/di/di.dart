import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';

import 'di.config.dart';

@InjectableInit.microPackage(
  ignoreUnregisteredTypes: [AppDirectory, Dio],
)
initMicroPackage() {}

final getIt = GetIt.instance;

@InjectableInit(
  ignoreUnregisteredTypes: [AppDirectory, Dio],
  externalPackageModules: [
    CoreDataPackageModule,
    CoreRouterPackageModule,
  ],
  includeMicroPackages: false,
)
Future<void> configureDependencies() async {
  await getIt.init();
}
