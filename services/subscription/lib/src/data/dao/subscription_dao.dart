import 'package:core_data/core_data.dart';
part 'subscription_dao.g.dart';

@HiveType(typeId: HiveIdentify.subscriptionId)
class SubscriptionDao {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String registrationDate;
  @HiveField(2)
  final String expirationDate;
  @HiveField(3)
  final String type;

  static const String boxName = 'subscriptionBox';
  static const String key = 'subscription';

  SubscriptionDao(
    this.id,
    this.registrationDate,
    this.expirationDate,
    this.type,
  );
}
