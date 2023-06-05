import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';

@injectable
class SettingController {
  final AppRouter appRouter;
  final AppDeepLink deepLink;

  SettingController(this.appRouter, this.deepLink);

  Future<void> logout() async {
    await Hive.deleteFromDisk();
    // ignore: invalid_use_of_visible_for_testing_member
    Hive.resetAdapters();
    await Future.delayed(const Duration(seconds: 1));
  }
}
