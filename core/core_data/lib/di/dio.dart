import 'package:core_data/src/app_config.dart';
import 'package:core_dependency/core_dependency.dart';

@module
abstract class DIOModule {
  @lazySingleton
  Dio dio(AppConfig appConfig) {
    final dio = Dio(
      BaseOptions(
        baseUrl: appConfig.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: 'application/json',
        receiveDataWhenStatusError: true,
      ),
    );

    final prettyDioLogger = PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 120);
    final retryInterceptor = RetryInterceptor(
      dio: dio,
      retries: 3,
    );
    dio.interceptors.addAll([
      prettyDioLogger,
      retryInterceptor,
    ]);
    return dio;
  }
}
