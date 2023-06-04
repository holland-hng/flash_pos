import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

@singleton
class OrdersDatabaseFactory extends DatabaseFactory {
  OrdersDatabaseFactory(AppDirectory appDir)
      : super(
          appDir.ordersFeature,
        );

  @override
  void initialize() {}
}
