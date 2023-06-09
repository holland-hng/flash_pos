import 'package:core_router/core_router.dart';
import 'package:firebase_service/firebase_service.dart';

import 'di.config.dart';
import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

// features
import 'package:menu/menu.dart';
import 'package:orders/orders.dart';
import 'package:setting/setting.dart';
import 'package:delivery/delivery.dart';
import 'package:floor_table/floor_table.dart';
import 'package:authentication/authentication.dart';

// services
import 'package:auth_service/auth_service.dart';
import 'package:customers_service/customers_service.dart';
import 'package:subscription_service/subscription_service.dart';

final getIt = GetIt.instance;

@InjectableInit(externalPackageModules: [
  // CORE
  CoreDataPackageModule,
  CoreRouterPackageModule,
  // SERVICES
  FirebaseServicePackageModule,
  AuthServicePackageModule,
  CustomersServicePackageModule,
  SubscriptionServicePackageModule,
  // FEATURES
  AuthenticationPackageModule,
  MenuPackageModule,
  FloorTablePackageModule,
  OrdersPackageModule,
  SettingPackageModule,
  DeliveryPackageModule,
])
Future<void> configureDependencies() async {
  await getIt.init();
}

Future<void> resetDependencies() async {
  await getIt.reset();
  await configureDependencies();
}
