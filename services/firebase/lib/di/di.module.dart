//@GeneratedMicroModule;FirebaseServicePackageModule;package:firebase_service/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:firebase_service/src/firebase/firebase.dart' as _i3;
import 'package:injectable/injectable.dart' as _i1;

class FirebaseServicePackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.lazySingleton<_i3.FirebaseService>(() => _i3.FirebaseService());
  }
}
