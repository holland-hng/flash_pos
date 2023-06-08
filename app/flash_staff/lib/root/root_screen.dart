import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:delivery/delivery.dart';
import 'package:flash_staff/di/di.dart';
import 'package:floor_table/floor_table.dart';
import 'package:flutter/material.dart';
import 'package:menu/menu.dart';
import 'package:orders/core/router/orders_router.dart';
import 'package:setting/core/router/setting_router.dart';
import 'package:subscription_service/subscription_service.dart';
import 'navigation_button_factory.dart';

@RoutePage()
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final subscriptionService = getIt<SubscriptionService>();
  late final subscription = subscriptionService.subscription;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      lazyLoad: false,
      routes: [
        if (subscription.isFullService) const FloorTableRoute(),
        const MenuRoute(),
        const OrdersRoute(),
        const DeliveryRoute(),
        const SettingRoute(),
      ],
      transitionBuilder: (context, child, animation) => child,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: FlashBottomNavigationBar(
            onTap: tabsRouter.setActiveIndex,
            selectedIndex: tabsRouter.activeIndex,
            subscription: subscription,
          ),
        );
      },
    );
  }
}

class FlashBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;
  final Subscription subscription;
  const FlashBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
    required this.subscription,
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
                      if (subscription.isFullService) NavButtonEnum.table,
                      NavButtonEnum.menu,
                      NavButtonEnum.orders,
                      NavButtonEnum.delivery,
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
