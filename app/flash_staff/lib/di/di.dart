import 'package:authentication/di/di.dart';
import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:flash_staff/core/app_config/app_config.dart';
import 'package:floor_table/floor_table.dart';
import 'package:menu/menu.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  getIt.registerSingleton<AppConfig>(StaffAppConfig());

  List<Future> coreDependencies = [
    coreDataConfigureDependencies(mainGetIt: getIt),
  ];
  await Future.wait(coreDependencies);

  List<Future> featureDependencies = [
    authFeatureConfigureDependencies(mainGetIt: getIt),
    menuFeatureConfigureDependencies(mainGetIt: getIt),
    floorFeatureConfigureDependencies(mainGetIt: getIt),
  ];
  await Future.wait(featureDependencies);

  getIt.init();
}
