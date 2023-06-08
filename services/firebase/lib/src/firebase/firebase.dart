import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'options/firebase_option_factory.dart';

@singleton
class FirebaseService {
  @preResolve
  @factoryMethod
  static Future<FirebaseService> getInstance(FlashEnvironment env) async {
    FirebaseOptionFactory factory;

    switch (env.flavor) {
      case Flavor.production:
        factory = ProductionFirebaseOptionFactory();
        break;
      default:
        factory = StagingFirebaseOptionFactory();
        break;
    }
    FirebaseOptions options = factory.currentPlatform.toFirebaseOption();
    try {
      await Firebase.initializeApp(
        options: options,
      );
      final type = factory.currentPlatform.runtimeType;
      debugPrint("DEBUG: Register firebase success $type");
    } catch (e) {
      debugPrint("DEBUG: Register firebase fail ${e.toString()}");
    }

    return FirebaseService();
  }
}
