import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

@singleton
class OrdersDatabaseFactory extends DatabaseFactory {
  OrdersDatabaseFactory(AppDirectory appDir)
      : super(
          databasePath: appDir.ordersFeature,
        );

  @preResolve
  @factoryMethod
  static Future<OrdersDatabaseFactory> getInstance(AppDirectory appDir) async {
    final database = OrdersDatabaseFactory(appDir);
    return database;
  }

  @override
  void initialize() {}
}

class HiveIdentify {}
