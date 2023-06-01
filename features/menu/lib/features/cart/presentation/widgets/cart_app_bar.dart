import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:menu/features/cart/presentation/cart_handler.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CartHandler cartHandler;
  const CartAppBar({
    super.key,
    required this.cartHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: FlashAppBar(
          tabBackgroundColor: Colors.grey.shade200,
          backgroundColor: Colors.white,
          floating: false,
          bottomHeight: 56,
          elevation: 0,
          titlePadding: const EdgeInsetsDirectional.only(
            top: 16,
            start: 18,
            end: 18,
            bottom: 0,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order details",
                    style: context.typo.headline4.bold,
                  ),
                  Obx(() {
                    return MiraiPopupMenu<int>(
                      children: Iterable<int>.generate(100).skip(1).toList(),
                      itemWidgetBuilder: (int index, item) {
                        return Text(
                          item.toString(),
                          style: context.typo.subtitle2,
                        );
                      },
                      onChanged: cartHandler.selectNumberPeople,
                      child: Container(
                        color: Colors.white,
                        key: GlobalKey(),
                        height: 44,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(Icons.group),
                            6.0.horizontal,
                            Text(
                              '${cartHandler.rxNumPeople}',
                              style: context.typo.subtitle1.semiBold,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
              14.0.vertical,
              Text(
                "Floor 1 - Table A002",
                style: context.typo.headline6.bold,
              ),
              4.0.vertical,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(112);
}
