import 'package:core_dependency/core_dependency.dart';
import 'package:subscription_service/src/data/repository_impl/subscription_local_data_source.dart';
import 'package:subscription_service/src/data/repository_impl/subscription_remote_data_source.dart';
import 'package:subscription_service/src/domain/subscription.dart';
import 'package:subscription_service/src/domain/subscription_service.dart';
import 'package:subscription_service/src/domain/subscription_snapshot.dart';

@LazySingleton(as: SubscriptionService)
class SubscriptionRepositoryImpl extends SubscriptionService {
  final SubscriptionLocalDataSource localDataSource;
  final SubscriptionRemoteDataSource remoteDataSource;

  @override
  SubscriptionSnapshot subscriptionSnapshot = const SubscriptionSnapshot();

  SubscriptionRepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Future<SubscriptionSnapshot> obtainSubscription() async {
    SubscriptionSnapshot result;
    Subscription subscription;

    try {
      final dto = await remoteDataSource.getSubscription();
      subscription = Subscription.fromDto(dto);
      localDataSource.cache(subscription.toDao());
      result = SubscriptionSnapshot(data: subscription);
    } catch (e) {
      final dao = localDataSource.getSubscription();
      if (dao != null) {
        subscription = Subscription.fromDao(dao);
        result = SubscriptionSnapshot(data: subscription);
      } else {
        // TODO: hacking code
        result = SubscriptionSnapshot(
          data: Subscription(
            id: 'fake_id',
            expirationDate: DateTime.now(),
            registrationDate: DateTime.now(),
            type: SubscriptionType.express,
          ),
        );
        //result = SubscriptionSnapshot(error: GetSubscriptionError());
      }
    }
    subscriptionSnapshot = result;
    return result;
  }
}
