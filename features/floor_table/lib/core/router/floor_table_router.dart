import 'package:core_router/core_router.dart';

import '../../features/floor_table/presentation/floor_table_screen.dart';

part 'floor_table_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class FloorTableRouter extends _$FloorTableRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: FloorTableRoute.page),
      ];
}
