import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class FlashAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final double? elevation;
  final bool? centerTitle;
  final Color? backgroundColor;
  const FlashAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.elevation,
    this.height = 38,
    this.automaticallyImplyLeading = true,
    this.centerTitle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          centerTitle: centerTitle,
          leading: leading,
          actions: actions,
          automaticallyImplyLeading: automaticallyImplyLeading,
          backgroundColor: backgroundColor ?? context.color.surface,
          toolbarHeight: height,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: Text(
              title,
              style: context.typo.subtitle2.semiBold
                  .mergeStyle(color: context.color.text),
            ),
          ),
        ),
        const HorDivider(
          height: 0.5,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height + 0.5);
}
