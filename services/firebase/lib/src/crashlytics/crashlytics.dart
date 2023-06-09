import 'package:core_dependency/core_dependency.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

@Singleton(order: 1)
class FlashCrashlytics {
  FlashCrashlytics() {
    initialize();
  }
  void initialize() {
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode);
    if (kReleaseMode) {
      FlutterError.onError = (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
    }
  }
}
