library core_data;

export 'package:core_data/src/environment/environment.dart';
export 'package:core_data/src/app_config/app_config.dart';
export 'di/di.dart' hide getIt;

//database
export 'package:core_data/src/app_directory/app_directory.dart';
export 'package:core_data/src/database/database_factory.dart';
export 'package:core_data/src/database/database.dart';
export 'package:core_data/src/database/hive_identify.dart';
export 'package:hive_flutter/hive_flutter.dart';
export 'package:hive/hive.dart';

//control modular
export 'package:event_bus/event_bus.dart';

export 'package:connectivity_plus/connectivity_plus.dart';
