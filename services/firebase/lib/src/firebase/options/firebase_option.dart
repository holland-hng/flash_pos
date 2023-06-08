import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

abstract class FirebaseOptionInterface {
  String get apiKey;
  String get appId;
  String get messagingSenderId;
  String get projectId;
  String get storageBucket;
  String get iosClientId => "";
  String get iosBundleId => "";

  FirebaseOptions toFirebaseOption() {
    return FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: messagingSenderId,
      projectId: projectId,
      iosClientId: iosClientId,
      iosBundleId: iosBundleId,
    );
  }
}
