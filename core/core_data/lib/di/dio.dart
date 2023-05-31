import 'package:core_dependency/core_dependency.dart';

@module
abstract class DIOModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
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

    dio.interceptors.add(prettyDioLogger);
    final retryInterceptor = RetryInterceptor(
      dio: dio,
      retries: 3,
      retryDelays: const [Duration.zero],
    );
    dio.interceptors.add(retryInterceptor);
    return dio;
  }
}
