import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/foundation.dart';
import 'auth_local_data_source.dart';
import 'auth_remote_data_source.dart';

@Singleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthServiceImpl(this.localDataSource, this.remoteDataSource);

  @override
  Auth get auth {
    return localDataSource.getAuth();
  }

  @override
  bool get authenticated {
    return token.isNotEmpty && refreshToken.isNotEmpty;
  }

  @override
  String get refreshToken => auth.refreshToken;

  @override
  String get token => auth.token;

  @override
  Future<Auth> login(FormLogin form) async {
    //TODO: testing
    //final auth = await remoteDataSource.login(form.toDto());
    await Future.delayed(const Duration(seconds: 2));
    final Auth auth = Auth(token: "token", refreshToken: "refreshToken");
    await localDataSource.cacheAuth(auth);
    return auth;
  }

  @override
  Future<void> logout() async {
    debugPrint("clear cache");
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<Auth> tryRefreshToken() async {
    //TODO: testing
    await Future.delayed(const Duration(seconds: 2));
    final Auth auth = Auth(token: "token", refreshToken: "refreshToken");
    await localDataSource.cacheAuth(auth);
    return auth;
  }
}
