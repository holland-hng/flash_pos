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
      title: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Menu",
              style: context.typo.headline5.bold,
            ),
            const SizedBox(
              width: 250,
              height: 38,
              child: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: SearchField(),
              ),
            )
          ],
        ),
      ),
      bottomHeight: 52,
      backgroundColor: Colors.grey.shade100,
    );
  }
}
