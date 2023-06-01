import 'package:core_router/core_router.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flash_manager/core/router/manager_router.dart';
import 'package:flash_manager/features/root/presentation/slide_menu_wrapper.dart';
import 'package:floor_table/core/route/floor_table_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final SideMenuController sideMenuController = SideMenuController();

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DashBoardRoute(),
        FloorTableRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return SlideMenuWrapper(
          onTapMenuItem: (index) {
            tabsRouter.setActiveIndex(index);
          },
          child: child,
        );
      },
    );
  }
}
