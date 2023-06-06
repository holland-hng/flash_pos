import 'package:core_dependency/core_dependency.dart';
import 'package:subscription_service/subscription_service.dart';

@module
abstract class Module {
  @preResolve
  @singleton
  Future<SubscriptionSnapshot> subscriptionSnapshot(
      SubscriptionService service) async {
    final result = await service.obtainSubscription();
    return result;
  }
}
