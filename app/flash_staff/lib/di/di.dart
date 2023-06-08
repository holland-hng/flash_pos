import 'di.config.dart';
import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

// features
import 'package:menu/menu.dart' as menu;
import 'package:orders/orders.dart' as orders;
import 'package:setting/setting.dart' as setting;
import 'package:delivery/delivery.dart' as delivery;
import 'package:floor_table/floor_table.dart' as floor;
import 'package:authentication/authentication.dart' as auth;

// services
import 'package:auth_service/auth_service.dart' as auth_service;
import 'package:customers_service/customers_service.dart' as customers_service;
import 'package:subscription_service/subscription_service.dart'
    as subscription_service;

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await initCoreDependencies(mainGetIt: getIt);
  await initServiceDependencies();
  await initFeatureDependencies();
  getIt.init();
}

Future<void> initServiceDependencies() async {
  List<Future> featureDependencies = [
    auth_service.configureDependencies(mainGetIt: getIt),
    customers_service.configureDependencies(mainGetIt: getIt),
    subscription_service.configureDependencies(mainGetIt: getIt),
  ];
  await Future.wait(featureDependencies);
}

Future<void> initFeatureDependencies() async {
  List<Future> featureDependencies = [
    auth.configureDependencies(mainGetIt: getIt),
    menu.configureDependencies(mainGetIt: getIt),
    floor.configureDependencies(mainGetIt: getIt),
    orders.configureDependencies(mainGetIt: getIt),
    setting.configureDependencies(mainGetIt: getIt),
    delivery.configureDependencies(mainGetIt: getIt),
  ];
  await Future.wait(featureDependencies);
}

Future<void> resetDependencies() async {
  await getIt.reset();
  await configureDependencies();
}
