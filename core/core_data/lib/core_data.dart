library core_data;

export 'package:core_data/src/app_config.dart';
export 'package:core_data/di/dio.dart';
export 'di/di.dart' show coreDataConfigureDependencies;

//database
export 'package:core_data/src/app_directory.dart';
export 'package:core_data/src/database.dart';
export 'package:hive/hive.dart';
export 'package:hive_flutter/hive_flutter.dart';
export 'package:core_data/src/hive_identify.dart';

//control modular
export 'package:event_bus/event_bus.dart';

//auth
export 'package:core_data/src/app_auth.dart';
