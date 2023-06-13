import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:customers_service/di/di.module.dart';
import 'package:ticket_service/di/di.module.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit.microPackage(
  ignoreUnregisteredTypes: [AppRouter, AppDeepLink],
)
initMicroPackage() {}

// just for single module run testing
@InjectableInit(
  externalPackageModules: [
    CoreDataPackageModule,
    CoreRouterPackageModule,
    TicketServicePackageModule,
    CustomersServicePackageModule,
  ],
  includeMicroPackages: false,
  ignoreUnregisteredTypes: [AppRouter, AppDeepLink],
)
Future<void> configureDependencies() async {
  await getIt.init();
}
