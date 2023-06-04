// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormLoginDto _$FormLoginDtoFromJson(Map<String, dynamic> json) => FormLoginDto(
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$FormLoginDtoToJson(FormLoginDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
