import 'package:flutter/foundation.dart';
import 'firebase_option.dart';
import 'production_options.dart';
import 'staging_options.dart';

class StagingFirebaseOptionFactory extends FirebaseOptionFactory {
  @override
  FirebaseOptionInterface get android => AndroidStagingOption();

  @override
  FirebaseOptionInterface get ios => IOSStagingOption();
}

class ProductionFirebaseOptionFactory extends FirebaseOptionFactory {
  @override
  FirebaseOptionInterface get android => AndroidProdOption();

  @override
  FirebaseOptionInterface get ios => IOSProdOption();
}

abstract class FirebaseOptionFactory {
  FirebaseOptionInterface get android;
  FirebaseOptionInterface get ios;
  FirebaseOptionInterface get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
}
