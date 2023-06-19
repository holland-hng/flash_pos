import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class DropDownItemWidget extends StatelessWidget {
  final bool isSelected;
  const DropDownItemWidget({
    Key? key,
    required this.item,
    this.isSelected = false,
  }) : super(key: key);

  final (IconData?, String) item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (item.$1 != null)
          Icon(
            item.$1,
            color: Colors.black54,
            size: 20,
          ),
        if (item.$1 != null) 8.0.horizontal,
        Expanded(
          child: Text(
            item.$2,
            style: TextStyle(
              color: isSelected ? context.color.primary : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
