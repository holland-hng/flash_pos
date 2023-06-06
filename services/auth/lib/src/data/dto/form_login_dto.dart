import 'package:auth_service/src/domain/form_login.dart';
import 'package:core_dependency/core_dependency.dart';
part 'form_login_dto.g.dart';

@JsonSerializable()
class FormLoginDto extends FormLogin {
  const FormLoginDto(
    String email,
    String password,
  ) : super(email: email, password: password);

  factory FormLoginDto.fromJson(Map<String, dynamic> json) =>
      _$FormLoginDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FormLoginDtoToJson(this);
}
