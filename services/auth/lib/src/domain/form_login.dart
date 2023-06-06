import 'package:auth_service/src/data/dto/form_login_dto.dart';

class FormLogin {
  final String email;
  final String password;

  const FormLogin({
    this.email = '',
    this.password = '',
  });

  FormLogin copyWith({
    String? email,
    String? password,
  }) {
    return FormLogin(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  FormLoginDto toDto() {
    return FormLoginDto(email, password);
  }
}
