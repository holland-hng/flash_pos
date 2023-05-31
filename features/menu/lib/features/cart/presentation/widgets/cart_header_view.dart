import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';

class CartHeaderView extends StatelessWidget implements PreferredSizeWidget {
  final List<String> titleTabs;
  final Function(int)? selectNumberPeople;
  const CartHeaderView({
    super.key,
    required this.titleTabs,
    required this.selectNumberPeople,
  });

  @override
  Widget build(BuildContext context) {
    return FlashAppBar(
      tabBackgroundColor: Colors.grey.shade200,
      backgroundColor: Colors.white,
      floating: false,
      tabs: titleTabs,
      bottomHeight: 56,
      titlePadding: EdgeInsetsDirectional.only(
        top: 0,
        start: 18,
        end: 18,
        bottom: titleTabs.length <= 1 ? 0 : 62,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Order details",
            style: context.typo.headline4.bold,
          ),
          MiraiPopupMenu<int>(
            children: Iterable<int>.generate(100).skip(1).toList(),
            itemWidgetBuilder: (int index, item) {
              return Text(
                item.toString(),
                style: context.typo.subtitle2,
              );
            },
            onChanged: selectNumberPeople,
            child: SizedBox(
              key: GlobalKey(),
              height: 44,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.group),
                  6.0.horizontal,
                  Text(
                    titleTabs.length.toString(),
                    style: context.typo.subtitle1.semiBold,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(56 + (titleTabs.length <= 1 ? 0 : 62));
}
