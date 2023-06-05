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
      color: Colors.white,
      child: SafeArea(
        child: FlashAppBarDeprecated(
          tabBackgroundColor: Colors.grey.shade200,
          backgroundColor: Colors.white,
          floating: false,
          bottomHeight: 0,
          elevation: 0,
          titlePadding: const EdgeInsetsDirectional.only(
            top: 0,
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
                    "Tickets",
                    style: context.typo.headline6.bold,
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
                            const Icon(
                              Icons.group,
                              size: 22,
                            ),
                            6.0.horizontal,
                            Text(
                              '${cartHandler.rxNumPeople}',
                              style: context.typo.subtitle2.semiBold,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
              18.0.vertical,
              Text(
                "Floor 1 - Table A002",
                style: context.typo.subtitle2.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(96);
}
