import 'package:flutter/material.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';

class MiraiDropdownWidget<String> extends StatelessWidget {
  const MiraiDropdownWidget({
    Key? key,
    required this.itemWidgetBuilder,
    required this.children,
    required this.onChanged,
    this.underline = false,
    this.showSeparator = true,
    this.exit = MiraiExit.fromAll,
    this.chevronDownColor,
    this.showMode = MiraiShowMode.bottom,
    this.maxHeight,
    this.showSearchTextField = false,
    this.showOtherAndItsTextField = false,
    this.other,
    required this.child,
  }) : super(key: key);

  final MiraiDropdownBuilder<String> itemWidgetBuilder;
  final List<String> children;
  final ValueChanged<String> onChanged;
  final bool underline;
  final bool showSeparator;
  final MiraiExit exit;
  final Color? chevronDownColor;
  final MiraiShowMode showMode;
  final double? maxHeight;
  final bool showSearchTextField;
  final bool showOtherAndItsTextField;
  final Widget? other;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MiraiPopupMenu<String>(
      key: UniqueKey(),
      enable: true,
      space: 4,
      showMode: showMode,
      mode: MiraiPopupMenuMode.dropDownMenu,
      exit: exit,
      showSeparator: showSeparator,
      children: children,
      itemWidgetBuilder: itemWidgetBuilder,
      onChanged: onChanged,
      maxHeight: maxHeight,
      showOtherAndItsTextField: showOtherAndItsTextField,
      showSearchTextField: showSearchTextField,
      other: other,
      child: SizedBox(
        key: GlobalKey(),
        child: child,
      ),
    );
  }
}
