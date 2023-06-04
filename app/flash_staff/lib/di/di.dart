import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

import 'package:flash_staff/core/app_config/app_config.dart';
import 'package:floor_table/floor_table.dart' as floor;
import 'package:menu/menu.dart' as menu;
import 'package:orders/orders.dart' as orders;
import 'package:setting/setting.dart' as setting;
import 'package:delivery/delivery.dart' as delivery;
import 'package:authentication/authentication.dart' as auth;
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.registerSingleton<AppConfig>(StaffAppConfig());
  await initCoreDependencies(mainGetIt: getIt);
  await initFeatureDependencies();
  getIt.init();
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
