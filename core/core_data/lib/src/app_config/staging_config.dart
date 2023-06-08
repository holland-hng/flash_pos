import 'package:core_dependency/core_dependency.dart';

import 'app_config.dart';

part 'staging_config.g.dart';

@Envied(path: '.staging.env')
class StagingConfig extends AppConfig {
  @override
  @EnviedField(varName: 'baseUrl', obfuscate: true)
  final String baseUrl = _StagingConfig.baseUrl;

  @override
  @EnviedField(varName: 'encryptionKey', obfuscate: true)
  final String encryptionKey = _StagingConfig.encryptionKey;
}
