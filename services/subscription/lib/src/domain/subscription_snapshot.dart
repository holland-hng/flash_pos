import 'package:core_dependency/core_dependency.dart';
import 'package:subscription_service/src/domain/subscription.dart';

class GetSubscriptionError extends Error {}

class SubscriptionSnapshot extends Equatable {
  final Subscription? data;
  final Error? error;

  bool get isIdle {
    return data == null && error == null;
  }

  bool get hasData {
    return data != null;
  }

  bool get hasError {
    return error != null;
  }

  const SubscriptionSnapshot({this.data, this.error});

  @override
  List<Object?> get props => [data, error];

  SubscriptionSnapshot copyWith({
    Subscription? data,
    Error? error,
  }) {
    return SubscriptionSnapshot(
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
