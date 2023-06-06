import 'auth.dart';
import 'form_login.dart';

abstract class AuthService implements Auth {
  Auth get auth;
  bool get authenticated;

  Future<Auth> login(FormLogin form);

  Future<Auth> tryRefreshToken();

  Future<void> logout();
}
