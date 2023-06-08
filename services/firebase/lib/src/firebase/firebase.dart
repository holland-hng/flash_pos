import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'options/firebase_option_factory.dart';

@lazySingleton
class FirebaseService {
  @preResolve
  @factoryMethod
  Future<FirebaseService> getInstance(FlashEnvironment env) async {
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
    await Firebase.initializeApp(
      options: options,
    );
    return FirebaseService();
  }
}
