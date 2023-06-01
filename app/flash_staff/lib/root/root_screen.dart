import 'package:core_router/core_router.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:floor_table/core/route/floor_table_router.dart';
import 'package:flutter/material.dart';
import 'package:menu/menu.dart';

@RoutePage()
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final SideMenuController sideMenuController = SideMenuController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      lazyLoad: false,
      routes: const [
        FloorTableRoute(),
        MenuRoute(),
      ],
      transitionBuilder: (context, child, animation) => child,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Row(
          children: [
            NavigationRail(
              backgroundColor: Colors.white,
              selectedIndex: tabsRouter.activeIndex,
              groupAlignment: -1,
              onDestinationSelected: (int index) {
                tabsRouter.setActiveIndex(index);
              },
              leading: Container(
                padding: const EdgeInsets.only(top: 2),
                margin: const EdgeInsets.only(top: 6, bottom: 90),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blueAccent),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.flash_on,
                  size: 34,
                  color: Colors.blueGrey,
                ),
              ),
              labelType: NavigationRailLabelType.all,
              destinations: NavButtonFactory.createList(
                [
                  NavButtonEnum.table,
                  NavButtonEnum.menu,
                  NavButtonEnum.orders,
                  NavButtonEnum.delivery,
                  NavButtonEnum.setting,
                ],
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 0.2,
              color: Colors.grey.shade300,
            ),
            Expanded(child: child),
          ],
        );
      },
    );
  }
}

class NavButtonFactory {
  static NavigationRailDestination create(NavButtonEnum type) {
    return NavigationRailDestination(
      icon: Icon(
        type.iconData,
        size: 34,
      ),
      label: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(type.label),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
    );
  }

  static List<NavigationRailDestination> createList(List<NavButtonEnum> types) {
    return types.map((type) => create(type)).toList();
  }
}

enum NavButtonEnum {
  table,
  menu,
  orders,
  delivery,
  setting,
}

extension NavButtonEnumExtension on NavButtonEnum {
  IconData get iconData {
    switch (this) {
      case NavButtonEnum.table:
        return Icons.layers;
      case NavButtonEnum.menu:
        return Icons.widgets_rounded;
      case NavButtonEnum.orders:
        return Icons.event_note;
      case NavButtonEnum.delivery:
        return Icons.delivery_dining_sharp;
      case NavButtonEnum.setting:
        return Icons.settings;
      default:
        throw UnimplementedError();
    }
  }

  String get label {
    switch (this) {
      case NavButtonEnum.table:
        return "Table";
      case NavButtonEnum.menu:
        return "Menu";
      case NavButtonEnum.orders:
        return "Orders";
      case NavButtonEnum.delivery:
        return "Delivery";
      case NavButtonEnum.setting:
        return "Setting";
      default:
        throw UnimplementedError();
    }
  }
}
