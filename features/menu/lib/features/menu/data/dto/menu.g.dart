// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuDto _$MenuDtoFromJson(Map<String, dynamic> json) => MenuDto(
      (json['categories'] as List<dynamic>)
          .map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuDtoToJson(MenuDto instance) => <String, dynamic>{
      'categories': instance.data,
    };
