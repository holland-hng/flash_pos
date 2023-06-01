import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
part 'app_config.g.dart';

@Singleton(as: AppConfig)
@Envied(path: '.env')
class StaffAppConfig implements AppConfig {
  @factoryMethod
  StaffAppConfig(Dio dio) {
    dio.options.baseUrl = baseUrl;
  }
  @override
  @EnviedField(varName: 'baseUrl', obfuscate: true)
  final String baseUrl = _StaffAppConfig.baseUrl;
}
