import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(ignoreUnregisteredTypes: [AppDirectory, Dio])
Future<void> configureDependencies({GetIt? mainGetIt}) async {
  final internalGetIt = mainGetIt ?? getIt;
  final isSubmodule = mainGetIt == null;

  if (isSubmodule) {
    await initCoreDependencies(mainGetIt: getIt);
  }

  internalGetIt.init();
}
