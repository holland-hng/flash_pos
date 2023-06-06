import 'dart:async';
import 'package:auth_service/src/domain/auth.dart';
import 'package:core_dependency/core_dependency.dart';
part 'auth_dto.g.dart';

@JsonSerializable()
class AuthDto extends Auth {
  AuthDto({
    required super.token,
    required super.refreshToken,
  });
  factory AuthDto.fromJson(Map<String, dynamic> json) =>
      _$AuthDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthDtoToJson(this);

  Auth toDomain() {
    return Auth(token: token, refreshToken: refreshToken);
  }
}

FutureOr<AuthDto> deserializeAuthDto(Map<String, dynamic> json) =>
    AuthDto.fromJson(json);
