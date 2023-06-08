import 'package:auth_service/auth_service.dart';
import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit.microPackage(
  ignoreUnregisteredTypes: [AuthService, AppRouter, AppDeepLink],
)
initMicroPackage() {}

// just for single module run testing
@InjectableInit(
  externalPackageModules: [
    CoreDataPackageModule,
    CoreRouterPackageModule,
    AuthServicePackageModule,
  ],
  includeMicroPackages: false,
  ignoreUnregisteredTypes: [AuthService, AppRouter, AppDeepLink],
)
Future<void> configureDependencies() async {
  await getIt.init();
}
