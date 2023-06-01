import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:flash_manager/core/router/manager_router.dart';

@module
abstract class Module {
  @lazySingleton
  AppRouter get appRouter {
    final managerRouter = ManagerRouter();
    final appRouter = AppRouter(managerRouter);
    return appRouter;
  }
}
