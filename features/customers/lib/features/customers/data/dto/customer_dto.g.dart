// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDto _$CustomerDtoFromJson(Map<String, dynamic> json) => CustomerDto(
      json['strMeal'] as String,
      json['strMealThumb'] as String,
      json['idMeal'] as String,
      json['address'] as String? ?? 'None',
      json['loyaltyPoint'] as int? ?? 0,
    );

Map<String, dynamic> _$CustomerDtoToJson(CustomerDto instance) =>
    <String, dynamic>{
      'strMeal': instance.name,
      'strMealThumb': instance.email,
      'idMeal': instance.phoneNumber,
      'address': instance.address,
      'loyaltyPoint': instance.loyaltyPoint,
    };
