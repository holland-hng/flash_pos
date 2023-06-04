import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
part 'app_config.g.dart';

@Envied(path: '.env')
class AuthAppConfig implements AppConfig {
  @override
  @EnviedField(varName: 'baseUrl', obfuscate: true)
  final String baseUrl = _AuthAppConfig.baseUrl;

  @override
  @EnviedField(varName: 'encryptionKey', obfuscate: true)
  final String encryptionKey = _AuthAppConfig.encryptionKey;

  @override
  List<int> get hiveEncryptionKey {
    return encryptionKey.split(',').map((e) => int.parse(e)).toList();
  }
}
