import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:menu/features/menu/presentation/menu_screen.dart';

part 'menu_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class MenuRouter extends _$MenuRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MenuRoute.page),
      ];
}
