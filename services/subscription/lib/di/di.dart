import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit.microPackage(
  ignoreUnregisteredTypes: [AppDirectory, Dio],
)
initMicroPackage() {}

// just for single module run testing
@InjectableInit(
    externalPackageModules: [
      CoreDataPackageModule,
      CoreRouterPackageModule,
    ],
    includeMicroPackages: false,
    ignoreUnregisteredTypes: [AppDirectory, Dio])
Future<void> configureDependencies() async {
  await getIt.init();
}
