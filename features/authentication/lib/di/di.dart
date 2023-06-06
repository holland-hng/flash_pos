import 'package:auth_service/auth_service.dart' as auth_service;
import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies({GetIt? mainGetIt}) async {
  final internalGetIt = mainGetIt ?? getIt;
  final isSubmodule = mainGetIt == null;

  if (isSubmodule) {
    await initCoreDependencies(mainGetIt: getIt);
    await initServiceDependencies();
  }

  internalGetIt.init();
}

Future<void> initServiceDependencies() async {
  List<Future> featureDependencies = [
    auth_service.configureDependencies(mainGetIt: getIt),
  ];
  await Future.wait(featureDependencies);
}
