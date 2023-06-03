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
          border: Border.all(
            width: 0.2,
            color: const Color.fromARGB(255, 224, 224, 224),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      height: 34,
    );
  }
}
