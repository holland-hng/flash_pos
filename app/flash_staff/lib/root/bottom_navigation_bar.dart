import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final int index;
  final IconData iconData;
  final String label;
  final Function(int) onTap;
  final bool isActive;
  const NavButton({
    super.key,
    required this.index,
    required this.iconData,
    required this.label,
    required this.onTap,
    required this.isActive,
  });

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    Color color = widget.isActive ? context.color.primary : Colors.grey;
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            widget.onTap.call(widget.index);
          },
          child: Ink(
            height: 46,
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.iconData,
                  color: color,
                  size: 18,
                ),
                8.0.horizontal,
                Text(
                  widget.label.toUpperCase(),
                  style: context.typo.body1.bold.mergeStyle(color: color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
