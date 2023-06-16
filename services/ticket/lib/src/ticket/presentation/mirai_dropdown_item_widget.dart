import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MiraiDropDownItemWidget extends StatelessWidget {
  const MiraiDropDownItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final (IconData, String) item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          item.$1,
          color: Colors.black54,
          size: 20,
        ),
        8.0.horizontal,
        Expanded(
          child: Text(
            item.$2,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
