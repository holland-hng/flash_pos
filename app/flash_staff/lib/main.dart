import 'dart:async';
import 'package:flash_staff/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((value) async {
    await configureDependencies();
    runApp(const StaffApp());
  });
}
