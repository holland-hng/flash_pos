import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
part 'menu_app_config.g.dart';

@Envied(path: '.env')
class MenuAppConfig extends AppConfig {
  @override
  @EnviedField(varName: 'baseUrl', obfuscate: true)
  final String baseUrl = _MenuAppConfig.baseUrl;
}
