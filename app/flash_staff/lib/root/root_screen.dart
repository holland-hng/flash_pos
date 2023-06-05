import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:customers/customers.dart';
import 'package:floor_table/floor_table.dart';
import 'package:flutter/material.dart';
import 'package:menu/menu.dart';
import 'package:orders/core/router/orders_router.dart';
import 'package:setting/core/router/setting_router.dart';
import 'navigation_button_factory.dart';

@RoutePage()
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      lazyLoad: false,
      routes: const [
        FloorTableRoute(),
        MenuRoute(),
        OrdersRoute(),
        CustomersRoute(),
        SettingRoute(),
      ],
      transitionBuilder: (context, child, animation) => child,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: FlashBottomNavigationBar(
            onTap: tabsRouter.setActiveIndex,
            selectedIndex: tabsRouter.activeIndex,
          ),
        );
      },
    );
  }
}

class FlashBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;
  const FlashBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HorDivider(),
            Container(
              color: Colors.white,
              height: 40,
              child: Row(
                children: [
                  const Expanded(child: SizedBox()),
                  ...NavButtonFactory.createList(
                    onTap: onTap,
                    selectedIndex: AutoTabsRouter.of(context).activeIndex,
                    types: [
                      NavButtonEnum.table,
                      NavButtonEnum.menu,
                      NavButtonEnum.orders,
                      NavButtonEnum.customers,
                      NavButtonEnum.settings,
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
