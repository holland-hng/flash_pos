// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomersDto _$CustomersDtoFromJson(Map<String, dynamic> json) => CustomersDto(
      (json['users'] as List<dynamic>)
          .map((e) => CustomerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomersDtoToJson(CustomersDto instance) =>
    <String, dynamic>{
      'users': instance.data,
    };
