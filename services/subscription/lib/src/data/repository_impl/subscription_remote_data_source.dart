import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/foundation.dart';
import 'package:subscription_service/src/data/dto/subscription_dto.dart';
part 'subscription_remote_data_source.g.dart';

@lazySingleton
@RestApi(parser: Parser.FlutterCompute)
abstract class SubscriptionRemoteDataSource {
  @factoryMethod
  factory SubscriptionRemoteDataSource(Dio dio) = _SubscriptionRemoteDataSource;

  @GET("/subscription")
  Future<SubscriptionDto> getSubscription();
}
