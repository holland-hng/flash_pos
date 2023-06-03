import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
part 'app_config.g.dart';

@Envied(path: '.env')
class OrdersAppConfig extends AppConfig {
  @factoryMethod
  OrdersAppConfig(Dio dio) {
    dio.options.baseUrl = baseUrl;
  }
  @override
  @EnviedField(varName: 'baseUrl', obfuscate: true)
  final String baseUrl = _OrdersAppConfig.baseUrl;
}
