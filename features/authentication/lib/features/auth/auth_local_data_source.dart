import 'package:authentication/core/database/database.dart';
import 'package:authentication/features/auth/data/dao/auth_dao.dart';
import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

@singleton
class AuthLocalDataSource {
  final Database<AuthDao> database;

  AuthLocalDataSource(this.database);

  @preResolve
  @factoryMethod
  static Future<AuthLocalDataSource> getInstance(
    AuthDatabaseFactory databaseFactory,
    AppConfig appConfig,
  ) async {
    final database = await databaseFactory.open<AuthDao>(
      name: AuthDao.hiveKey,
      encryptionCipher: HiveAesCipher(appConfig.hiveEncryptionKey),
    );
    return AuthLocalDataSource(database);
  }

  Auth getAuth() {
    try {
      final auth = database.get(AuthDao.hiveKey)!;
      return auth;
    } catch (e) {
      return Auth.empty();
    }
  }
}
