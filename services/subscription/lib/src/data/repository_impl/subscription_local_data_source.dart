import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:subscription_service/database/database.dart';
import 'package:subscription_service/src/data/dao/subscription_dao.dart';

@lazySingleton
class SubscriptionLocalDataSource {
  final Database<SubscriptionDao> database;

  SubscriptionLocalDataSource(this.database);

  @preResolve
  @factoryMethod
  static Future<SubscriptionLocalDataSource> getInstance(
    SubscriptionDatabaseFactory databaseFactory,
  ) async {
    final database = await databaseFactory.open<SubscriptionDao>(
      name: SubscriptionDao.boxName,
    );
    return SubscriptionLocalDataSource(database);
  }

  SubscriptionDao? getSubscription() {
    final result = database.get(SubscriptionDao.key);
    return result;
  }

  void cache(SubscriptionDao dao) {
    database.put(SubscriptionDao.key, dao);
  }
}
