import 'package:auth_service/src/data/dto/auth_dto.dart';
import 'package:auth_service/src/data/dto/form_login_dto.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/foundation.dart';
part 'auth_remote_data_source.g.dart';

@lazySingleton
@RestApi(parser: Parser.FlutterCompute)
abstract class AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;

  @POST("/login")
  Future<AuthDto> login(@Body() FormLoginDto body);
}
