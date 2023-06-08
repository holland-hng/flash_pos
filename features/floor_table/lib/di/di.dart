import 'package:core_dependency/core_dependency.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit.microPackage()
initMicroPackage() {}

// just for single module run testing
@InjectableInit(
  includeMicroPackages: false,
)
Future<void> configureDependencies() async {
  await getIt.init();
}
