import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String title;
  final Color? tabBackgroundColor;
  const TabButton({
    super.key,
    required this.title,
    this.tabBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: tabBackgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      height: 38,
    );
  }
}
