import 'package:core_dependency/core_dependency.dart';

import 'package:floor_table/floor_table.dart' as floor_table;
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  List<Future> moduleDependencies = [
    floor_table.floorFeatureConfigureDependencies(mainGetIt: getIt),
  ];

  await Future.wait(moduleDependencies);
  getIt.init();
}
