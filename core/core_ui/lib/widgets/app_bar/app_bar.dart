import 'package:core_ui/theme/app_typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

class FlashAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final double? elevation;
  const FlashAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.elevation,
    this.height = 44,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: context.color.surface,
      toolbarHeight: 40,
      elevation: elevation ?? 0.1,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(
          title,
          style: context.typo.subtitle1.semiBold
              .mergeStyle(color: context.color.text),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
