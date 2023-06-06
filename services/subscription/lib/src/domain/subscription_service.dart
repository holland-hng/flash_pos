import 'package:subscription_service/src/data/repository_impl/subscription_repository_impl.dart';

import '../../subscription_service.dart';

/// the function uses [SubscriptionRepositoryImpl] to do stuff
abstract class SubscriptionService {
  SubscriptionSnapshot get subscriptionSnapshot;
  Subscription get subscription {
    return subscriptionSnapshot.data!;
  }

  Future<SubscriptionSnapshot> obtainSubscription();
}
