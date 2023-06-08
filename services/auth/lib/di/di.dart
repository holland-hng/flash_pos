import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'di.config.dart';

@InjectableInit.microPackage(
  ignoreUnregisteredTypes: [AppDirectory, Dio, AppConfig, AppRouter],
)
initMicroPackage() {}

final getIt = GetIt.instance;

// just for single module run testing
@InjectableInit(
  externalPackageModules: [
    CoreDataPackageModule,
    CoreRouterPackageModule,
  ],
  includeMicroPackages: false,
  ignoreUnregisteredTypes: [AppDirectory, Dio, AppConfig, AppRouter],
)
Future<void> configureDependencies() async {
  await getIt.init();
}
