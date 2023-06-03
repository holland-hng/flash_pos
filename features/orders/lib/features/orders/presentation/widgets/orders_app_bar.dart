import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlashAppBar(
      backgroundColor: Colors.grey.shade200,
      elevation: 0,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Orders history",
          style: context.typo.headline2.bold,
        ),
      ),
      titlePadding: const EdgeInsetsDirectional.only(
        top: 28,
        start: 18,
        end: 18,
        bottom: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(66);
}
