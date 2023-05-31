import 'package:core_data/di/di.dart';
import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';
import 'menu_controller.dart';
import 'widgets/main_menu_view/menu_view.dart';
import 'widgets/menu_right_side_view.dart';

@RoutePage()
class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final menuController = getIt<MenuFlashController>();
  @override
  void initState() {
    menuController.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade200,
      body: Row(
        children: [
          Expanded(
            child: MenuMiniApp(menuController: menuController),
          ),
          MenuRightSideView(menuController: menuController),
        ],
      ),
    );
  }
}
