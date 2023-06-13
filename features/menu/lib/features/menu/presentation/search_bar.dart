import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class FlashSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String)? onChanged;
  const FlashSearchBar({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SearchField(
            onChanged: onChanged,
            hintText: 'Food\'s name...',
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(36);
}
