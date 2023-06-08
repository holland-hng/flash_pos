import 'package:core_dependency/core_dependency.dart';
import 'package:floor_table/di/di.module.dart';
import 'package:floor_table/floor_table.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: 'init', // default
    preferRelativeImports: true, // default
    asExtension: true, // default
    externalPackageModules: [
      FloorTablePackageModule,
    ])
Future<void> configureDependencies() async {
  getIt.init();
}
