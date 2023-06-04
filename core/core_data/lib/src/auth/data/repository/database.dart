import 'package:core_data/core_data.dart';
import 'package:core_data/src/auth/data/dao/auth_dao.dart';
import 'package:core_dependency/core_dependency.dart';

@lazySingleton
class AuthDatabaseFactory extends DatabaseFactory {
  AuthDatabaseFactory(AppDirectory appDir)
      : super(appDir.authenticationFeature);

  @override
  void initialize() {
    registerAdapter<AuthDao>(AuthDaoAdapter());
  }
}
