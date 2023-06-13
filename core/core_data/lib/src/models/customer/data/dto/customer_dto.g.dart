// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDto _$CustomerDtoFromJson(Map<String, dynamic> json) => CustomerDto(
      json['firstName'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['eyeColor'] as String? ?? 'None',
      (json['height'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$CustomerDtoToJson(CustomerDto instance) =>
    <String, dynamic>{
      'firstName': instance.name,
      'email': instance.email,
      'phone': instance.phoneNumber,
      'eyeColor': instance.address,
      'height': instance.loyaltyPoint,
    };
