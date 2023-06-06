// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionDto _$SubscriptionDtoFromJson(Map<String, dynamic> json) =>
    SubscriptionDto(
      json['id'] as String,
      DateTime.parse(json['registrationDate'] as String),
      DateTime.parse(json['expirationDate'] as String),
      $enumDecode(_$SubscriptionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$SubscriptionDtoToJson(SubscriptionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'registrationDate': instance.registrationDate.toIso8601String(),
      'expirationDate': instance.expirationDate.toIso8601String(),
      'type': _$SubscriptionTypeEnumMap[instance.type]!,
    };

const _$SubscriptionTypeEnumMap = {
  SubscriptionType.express: 'express',
  SubscriptionType.fullService: 'full_service',
  SubscriptionType.idle: 'idle',
};
