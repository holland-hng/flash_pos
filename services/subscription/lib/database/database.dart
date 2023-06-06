import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:subscription_service/src/data/dao/subscription_dao.dart';

@lazySingleton
class SubscriptionDatabaseFactory extends DatabaseFactory {
  static const String subPath = '/database/subscription';
  SubscriptionDatabaseFactory(AppDirectory appDir)
      : super(appDir.dir + subPath);

  @override
  void initialize() {
    registerAdapter<SubscriptionDao>(SubscriptionDaoAdapter());
  }
}
