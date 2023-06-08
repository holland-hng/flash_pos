import 'package:core_dependency/core_dependency.dart';
import 'package:firebase_service/src/firebase/options/firebase_option.dart';

part 'staging_options.g.dart';

@Envied(path: '.android.staging.env', obfuscate: true)
class AndroidStagingOption extends FirebaseOptionInterface {
  @override
  @EnviedField(varName: 'apiKey')
  final String apiKey = _AndroidStagingOption.apiKey;

  @override
  @EnviedField(varName: 'appId')
  final String appId = _AndroidStagingOption.appId;

  @override
  @EnviedField(varName: 'messagingSenderId')
  final String messagingSenderId = _AndroidStagingOption.messagingSenderId;

  @override
  @EnviedField(varName: 'projectId')
  final String projectId = _AndroidStagingOption.projectId;

  @override
  @EnviedField(varName: 'storageBucket')
  final String storageBucket = _AndroidStagingOption.storageBucket;
}

@Envied(path: '.ios.staging.env', obfuscate: true)
class IOSStagingOption extends FirebaseOptionInterface {
  @override
  @EnviedField(varName: 'apiKey')
  final String apiKey = _IOSStagingOption.apiKey;

  @override
  @EnviedField(varName: 'appId')
  final String appId = _IOSStagingOption.appId;

  @override
  @EnviedField(varName: 'messagingSenderId')
  final String messagingSenderId = _IOSStagingOption.messagingSenderId;

  @override
  @EnviedField(varName: 'projectId')
  final String projectId = _IOSStagingOption.projectId;

  @override
  @EnviedField(varName: 'storageBucket')
  final String storageBucket = _IOSStagingOption.storageBucket;

  @override
  @EnviedField(varName: 'iosClientId')
  final String iosClientId = _IOSStagingOption.iosClientId;

  @override
  @EnviedField(varName: 'iosBundleId')
  final String iosBundleId = _IOSStagingOption.iosBundleId;
}
