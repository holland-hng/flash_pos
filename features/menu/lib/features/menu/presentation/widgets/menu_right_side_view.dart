import 'package:flutter/material.dart';
import 'package:menu/features/cart/presentation/cart_view.dart';
import 'package:menu/features/menu/presentation/menu_controller.dart';

class MenuRightSideView extends StatefulWidget {
  final MenuFlashController menuController;
  const MenuRightSideView({
    super.key,
    required this.menuController,
  });

  @override
  State<MenuRightSideView> createState() => _MenuRightSideViewState();
}

class _MenuRightSideViewState extends State<MenuRightSideView> {
  late MenuFlashController menuController = widget.menuController;
  final double width = 400;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(width: 0.5, color: Colors.grey.shade300),
        ),
      ),
      //padding: const EdgeInsets.only(left: 18, top: 14, right: 18, bottom: 28),
      child: CartView(
        cartHandler: menuController.cartHandler,
      ),
    );
  }
}
