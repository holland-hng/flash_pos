import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:setting/features/setting/presentation/setting_screen.dart';

part 'setting_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class SettingRouter extends _$SettingRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SettingRoute.page),
      ];
}
