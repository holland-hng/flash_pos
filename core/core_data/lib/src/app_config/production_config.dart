import 'package:core_dependency/core_dependency.dart';

import 'app_config.dart';

part 'production_config.g.dart';

@Envied(path: '.prod.env')
class ProductionConfig extends AppConfig {
  @override
  @EnviedField(varName: 'baseUrl', obfuscate: true)
  final String baseUrl = _ProductionConfig.baseUrl;

  @override
  @EnviedField(varName: 'encryptionKey', obfuscate: true)
  final String encryptionKey = _ProductionConfig.encryptionKey;
}
