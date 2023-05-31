import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:flash_staff/core/routeR/staff_router.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppRouter get appRouter {
    final staffRouter = StaffRouter();
    final appRouter = AppRouter(staffRouter);
    return appRouter;
  }
}
