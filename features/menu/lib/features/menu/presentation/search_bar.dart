import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class FlashSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const FlashSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.background,
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: SearchField(
            hintText: 'Food\'s name...',
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(36);
}
