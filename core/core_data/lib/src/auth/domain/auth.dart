class Auth {
  final String token;
  final String refreshToken;

  Auth({
    required this.token,
    required this.refreshToken,
  });

  factory Auth.empty() {
    return Auth(token: '', refreshToken: '');
  }
}
