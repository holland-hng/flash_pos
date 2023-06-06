import 'dart:async';

import 'package:core_dependency/core_dependency.dart';
import 'package:subscription_service/src/domain/subscription.dart';
part 'subscription_dto.g.dart';

@JsonSerializable()
class SubscriptionDto {
  final String id;
  final DateTime registrationDate;
  final DateTime expirationDate;
  final SubscriptionType type;

  SubscriptionDto(
    this.id,
    this.registrationDate,
    this.expirationDate,
    this.type,
  );

  factory SubscriptionDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionDtoToJson(this);
}

FutureOr<SubscriptionDto> deserializeSubscriptionDto(
        Map<String, dynamic> json) =>
    SubscriptionDto.fromJson(json);
