import 'package:auth_service/src/domain/auth_service.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';

@singleton
class AuthInterceptor extends QueuedInterceptor {
  final AuthService authService;
  final AppRouter appRouter;
  final Dio dio;

  AuthInterceptor(this.authService, this.appRouter, this.dio) {
    dio.interceptors.add(this);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        await authService.tryRefreshToken();
        return handler.resolve(await dio.fetch(err.requestOptions));
      } catch (e) {
        //TODO: need check more condition
        appRouter.replaceNamed('/login');
      }
    } else {
      return handler.next(err);
    }
  }
}
