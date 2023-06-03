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
  final Color activeColor = Colors.blueAccent;
  final Color inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    Color color = widget.isActive ? activeColor : inactiveColor;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  widget.iconData,
                  color: color,
                ),
                1.0.vertical,
                Text(
                  widget.label,
                  style: context.typo.body2.mergeStyle(color: color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
