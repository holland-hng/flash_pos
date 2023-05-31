// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsDto _$ProductsDtoFromJson(Map<String, dynamic> json) => ProductsDto(
      (json['meals'] as List<dynamic>)
          .map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsDtoToJson(ProductsDto instance) =>
    <String, dynamic>{
      'meals': instance.products,
    };
