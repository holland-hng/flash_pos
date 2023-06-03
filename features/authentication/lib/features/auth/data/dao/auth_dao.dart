import 'package:core_data/core_data.dart';
part 'auth_dao.g.dart';

@HiveType(typeId: HiveIdentify.authId)
class AuthDao extends HiveObject implements Auth {
  @HiveField(0)
  @override
  final String token;

  @HiveField(1)
  @override
  final String refreshToken;

  AuthDao(this.token, this.refreshToken);

  static const String hiveKey = 'auth';
}
