import 'package:authentication/features/auth/data/dao/auth_dao.dart';
import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

@singleton
class AuthDatabaseFactory extends DatabaseFactory {
  AuthDatabaseFactory(AppDirectory appDir)
      : super(
          databasePath: appDir.authenticationFeature,
        );

  @preResolve
  @factoryMethod
  static Future<AuthDatabaseFactory> getInstance(AppDirectory appDir) async {
    final database = AuthDatabaseFactory(appDir);
    return database;
  }

  @override
  void initialize() {
    registerAdapter<AuthDao>(AuthDaoAdapter());
  }
}
