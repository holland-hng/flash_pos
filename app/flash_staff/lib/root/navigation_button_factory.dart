import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';

class NavButtonFactory {
  static NavButton create({
    required int index,
    required NavButtonEnum type,
    required Function(int) onTap,
    required bool isActive,
  }) {
    return NavButton(
      key: ValueKey(index),
      label: type.label,
      iconData: type.iconData,
      index: index,
      onTap: onTap,
      isActive: isActive,
    );
  }

  static List<NavButton> createList({
    required List<NavButtonEnum> types,
    required Function(int) onTap,
    required int selectedIndex,
  }) {
    List<NavButton> list = [];
    for (int index = 0; index < types.length; index++) {
      list.add(
        create(
          index: index,
          onTap: onTap,
          type: types[index],
          isActive: selectedIndex == index,
        ),
      );
    }
    return list;
  }
}

enum NavButtonEnum {
  table,
  menu,
  orders,
  delivery,
  setting,
}

extension NavButtonEnumExtension on NavButtonEnum {
  IconData get iconData {
    switch (this) {
      case NavButtonEnum.table:
        return Icons.layers;
      case NavButtonEnum.menu:
        return Icons.widgets_rounded;
      case NavButtonEnum.orders:
        return Icons.event_note;
      case NavButtonEnum.delivery:
        return Icons.delivery_dining_sharp;
      case NavButtonEnum.setting:
        return Icons.settings;
      default:
        throw UnimplementedError();
    }
  }

  String get label {
    switch (this) {
      case NavButtonEnum.table:
        return "Table";
      case NavButtonEnum.menu:
        return "Menu";
      case NavButtonEnum.orders:
        return "Orders";
      case NavButtonEnum.delivery:
        return "Delivery";
      case NavButtonEnum.setting:
        return "Setting";
      default:
        throw UnimplementedError();
    }
  }
}
