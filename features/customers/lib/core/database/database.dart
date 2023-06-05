import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

@lazySingleton
class CustomersDatabaseFactory extends DatabaseFactory {
  CustomersDatabaseFactory(AppDirectory appDir) : super(appDir.menuFeature);

  @override
  void initialize() {}
}
