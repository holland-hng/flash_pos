import 'package:core_ui/theme/app_typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

import 'app_bar/app_bar.dart';
import 'spacer.dart';

class LeftPanelAction {
  final String title;

  LeftPanelAction(this.title);
}

class LeftPanelView<T extends LeftPanelAction> extends StatelessWidget {
  const LeftPanelView({
    super.key,
    required this.title,
    required this.onTap,
    required this.items,
  });

  final String title;
  final Function(int index, T item) onTap;
  final List<T> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.color.surface,
      appBar: FlashAppBar(title: title),
      body: ListView.separated(
        padding: const EdgeInsets.only(
          bottom: 36,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              onTap.call(index, item);
            },
            child: Ink(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              height: 60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    item.title,
                    style: context.typo.subtitle2.medium,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const HorDivider(
          horizontal: 18,
        ),
      ),
    );
  }
}
