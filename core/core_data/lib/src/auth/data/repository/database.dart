import 'package:core_data/core_data.dart';
import 'package:core_data/src/auth/data/dao/auth_dao.dart';
import 'package:core_dependency/core_dependency.dart';

@lazySingleton
class AuthDatabaseFactory extends DatabaseFactory {
  AuthDatabaseFactory(AppDirectory appDir)
      : super(
          databasePath: appDir.authenticationFeature,
        );

  @factoryMethod
  static AuthDatabaseFactory getInstance(AppDirectory appDir) {
    final database = AuthDatabaseFactory(appDir);
    return database;
  }

  @override
  void initialize() {
    registerAdapter<AuthDao>(AuthDaoAdapter());
  }
}
