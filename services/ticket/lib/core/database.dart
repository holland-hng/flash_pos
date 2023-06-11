import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

@lazySingleton
class TicketDatabaseFactory extends DatabaseFactory {
  static const String subPath = '/database/ticket';
  TicketDatabaseFactory(AppDirectory appDir) : super(appDir.dir + subPath);

  @override
  void initialize() {
    //registerAdapter<SubscriptionDao>(SubscriptionDaoAdapter());
  }
}
