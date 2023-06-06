import 'package:core_dependency/core_dependency.dart';
import 'package:subscription_service/src/data/dao/subscription_dao.dart';
import 'package:subscription_service/src/data/dto/subscription_dto.dart';

enum SubscriptionType {
  @JsonValue('express')
  express,
  @JsonValue('full_service')
  fullService,
  @JsonValue('idle')
  idle,
}

extension SubscriptionTypeExtension on SubscriptionType {
  String get string {
    switch (this) {
      case SubscriptionType.express:
        return 'express';
      case SubscriptionType.fullService:
        return 'full_service';
      default:
        return 'idle';
    }
  }
}

extension SubscriptionTypeString on String {
  SubscriptionType get subscriptionType {
    switch (this) {
      case 'express':
        return SubscriptionType.express;
      case 'full_service':
        return SubscriptionType.fullService;
      default:
        return SubscriptionType.idle;
    }
  }
}

class Subscription extends Equatable {
  final String id;
  final DateTime registrationDate;
  final DateTime expirationDate;
  final SubscriptionType type;

  bool get isExpress {
    return type == SubscriptionType.express;
  }

  bool get isFullService {
    return type == SubscriptionType.fullService;
  }

  const Subscription({
    required this.id,
    required this.registrationDate,
    required this.expirationDate,
    required this.type,
  });
  @override
  List<Object?> get props => [
        id,
        registrationDate,
        expirationDate,
        type,
      ];
  factory Subscription.fromDto(SubscriptionDto dto) {
    return Subscription(
      id: dto.id,
      registrationDate: dto.registrationDate,
      expirationDate: dto.expirationDate,
      type: dto.type,
    );
  }

  factory Subscription.fromDao(SubscriptionDao dao) {
    return Subscription(
      id: dao.id,
      registrationDate: DateTime.parse(dao.registrationDate),
      expirationDate: DateTime.parse(dao.expirationDate),
      type: dao.type.subscriptionType,
    );
  }

  SubscriptionDao toDao() {
    return SubscriptionDao(
      id,
      registrationDate.toIso8601String(),
      expirationDate.toIso8601String(),
      type.string,
    );
  }
}
