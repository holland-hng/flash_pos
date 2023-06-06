import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomerInfoView extends StatelessWidget {
  const CustomerInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 18 * 3) * 1 / 3;
    return Container(
      margin: const EdgeInsets.only(top: 18),
      width: width,
      color: context.color.surface,
    );
  }
}
