import 'package:core_dependency/core_dependency.dart';
import 'app_config.dart';

part 'dev_app_config.g.dart';

@Envied(path: '.env')
class DevAppConfig extends AppConfig {
  @override
  @EnviedField(varName: 'baseUrl', obfuscate: true)
  final String baseUrl = _DevAppConfig.baseUrl;

  @override
  @EnviedField(varName: 'encryptionKey', obfuscate: true)
  final String encryptionKey = _DevAppConfig.encryptionKey;

  @override
  List<int> get hiveEncryptionKey {
    return encryptionKey.split(',').map((e) => int.parse(e)).toList();
  }
}
