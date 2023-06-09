import 'dart:async';
import 'package:flash_staff/di/di.dart';
import 'package:flutter/material.dart';
import 'app.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const StaffApp());
}
