import 'package:core_dependency/core_dependency.dart';
import 'package:firebase_service/src/firebase/options/firebase_option.dart';

part 'production_options.g.dart';

@Envied(path: '.android.prod.env', obfuscate: true)
class AndroidProdOption extends FirebaseOptionInterface {
  @override
  @EnviedField(varName: 'apiKey')
  final String apiKey = _AndroidProdOption.apiKey;

  @override
  @EnviedField(varName: 'appId')
  final String appId = _AndroidProdOption.appId;

  @override
  @EnviedField(varName: 'messagingSenderId')
  final String messagingSenderId = _AndroidProdOption.messagingSenderId;

  @override
  @EnviedField(varName: 'projectId')
  final String projectId = _AndroidProdOption.projectId;

  @override
  @EnviedField(varName: 'storageBucket')
  final String storageBucket = _AndroidProdOption.storageBucket;
}

@Envied(path: '.ios.prod.env', obfuscate: true)
class IOSProdOption extends FirebaseOptionInterface {
  @override
  @EnviedField(varName: 'apiKey')
  final String apiKey = _IOSProdOption.apiKey;

  @override
  @EnviedField(varName: 'appId')
  final String appId = _IOSProdOption.appId;

  @override
  @EnviedField(varName: 'messagingSenderId')
  final String messagingSenderId = _IOSProdOption.messagingSenderId;

  @override
  @EnviedField(varName: 'projectId')
  final String projectId = _IOSProdOption.projectId;

  @override
  @EnviedField(varName: 'storageBucket')
  final String storageBucket = _IOSProdOption.storageBucket;

  @override
  @EnviedField(varName: 'iosClientId')
  final String iosClientId = _IOSProdOption.iosClientId;

  @override
  @EnviedField(varName: 'iosBundleId')
  final String iosBundleId = _IOSProdOption.iosBundleId;
}
