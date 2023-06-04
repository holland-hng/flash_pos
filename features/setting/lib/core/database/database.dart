import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

@lazySingleton
class MenuDatabaseFactory extends DatabaseFactory {
  MenuDatabaseFactory(AppDirectory appDir) : super(appDir.settingFeature);

  @override
  void initialize() {}
}
