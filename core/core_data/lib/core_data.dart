library core_data;

export 'package:core_data/di/di.module.dart';
export 'package:core_data/src/environment/environment.dart';
export 'package:core_data/src/app_config/app_config.dart';

// database
export 'package:core_data/src/app_directory/app_directory.dart';
export 'package:core_data/src/database/database_factory.dart';
export 'package:core_data/src/database/database.dart';
export 'package:core_data/src/database/hive_identify.dart';
export 'package:hive_flutter/hive_flutter.dart';
export 'package:hive/hive.dart';

// control modular
export 'package:event_bus/event_bus.dart';
export 'src/event_bus/events.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:core_data/src/models/enum.dart';

// MODEL ------------------------------------------------------------------------------
// product
export 'package:core_data/src/models/product/data/dto/product.dart';
export 'package:core_data/src/models/product/data/dao/product.dart';
export 'package:core_data/src/models/product/domain/product.dart';
export 'package:core_data/src/models/product/data/dao/product_option.dart';
// customer
export 'package:core_data/src/models/customer/data/dto/customer_dto.dart';
export 'package:core_data/src/models/customer/domain/customer.dart';
