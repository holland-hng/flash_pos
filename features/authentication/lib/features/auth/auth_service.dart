import 'package:authentication/features/auth/auth_local_data_source.dart';
import 'package:authentication/features/auth/auth_remote_data_source.dart';
import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

@singleton
class AuthService implements Auth {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthService(this.localDataSource, this.remoteDataSource);

  Auth get auth {
    return localDataSource.getAuth();
  }

  bool get authenticated {
    return token.isNotEmpty && refreshToken.isNotEmpty;
  }

  @override
  String get refreshToken => auth.refreshToken;

  @override
  String get token => auth.token;
}
