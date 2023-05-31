import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'search_field.dart';

class MenuAppBar extends StatelessWidget {
  final List<String> tabs;

  const MenuAppBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return FlashSliverAppBar(
      tabs: tabs,
      elevation: 0.5,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Flash Menu",
            style: context.typo.headline2.bold,
          ),
          const SizedBox(
            width: 250,
            height: 42,
            child: SearchField(),
          )
        ],
      ),
      titlePadding: const EdgeInsetsDirectional.only(
        bottom: 62,
        start: 18,
        end: 18,
      ),
      bottomHeight: 62,
      backgroundColor: Colors.grey.shade200,
    );
  }
}
