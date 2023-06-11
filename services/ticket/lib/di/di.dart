import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:ticket_service/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit.microPackage(
  ignoreUnregisteredTypes: [AppDirectory, Dio],
)
initMicroPackage() {}

@InjectableInit(
  ignoreUnregisteredTypes: [AppDirectory, Dio],
  externalPackageModules: [
    CoreDataPackageModule,
  ],
  includeMicroPackages: false,
)
Future<void> configureDependencies() async {
  await getIt.init();
}
