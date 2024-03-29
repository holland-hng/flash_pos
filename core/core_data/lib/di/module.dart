import 'package:core_data/src/app_config/app_config.dart';
import 'package:core_data/src/app_config/production_config.dart';
import 'package:core_data/src/app_config/staging_config.dart';
import 'package:core_data/src/app_directory/app_directory.dart';
import 'package:core_data/src/environment/environment.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:event_bus/event_bus.dart';

@module
abstract class DIModule {
  @preResolve
  Future<AppDirectory> get appDirectory => AppDirectory.getInstance();

  @lazySingleton
  EventBus get eventBus => EventBus();

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
      maxWidth: 120,
    );
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

  @singleton
  FlashEnvironment get flashEnvironment => FlashEnvironment.instance;

  @singleton
  AppConfig appConfig(FlashEnvironment env) {
    AppConfig config;
    switch (env.flavor) {
      case Flavor.staging:
        config = StagingConfig();
        break;
      case Flavor.production:
        config = ProductionConfig();
        break;
      default:
        throw UnimplementedError();
    }
    return config;
  }
}
