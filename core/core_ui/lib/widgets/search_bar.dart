import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class FlashSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String)? onChanged;
  final String hint;
  final List<Widget>? actions;
  const FlashSearchBar({
    super.key,
    this.onChanged,
    required this.hint,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Flexible(
                child: SearchField(
                  onChanged: onChanged,
                  hintText: hint,
                ),
              ),
              if (actions != null)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: actions!,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(38);
}
