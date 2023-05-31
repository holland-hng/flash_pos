import 'package:flutter/material.dart';

extension DoubleExtension on double {
  SizedBox get vertical {
    return SizedBox(width: 0, height: this);
  }

  SizedBox get horizontal {
    return SizedBox(width: this, height: 0);
  }
}

class HorDivider extends StatelessWidget {
  final double height;
  final double vertical;
  final double horizontal;
  const HorDivider({
    super.key,
    this.height = 0.5,
    this.vertical = 0,
    this.horizontal = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      color: Colors.grey.shade300,
    );
  }
}

class VerDivider extends StatelessWidget {
  final double width;
  final double vertical;
  final double horizontal;
  const VerDivider({
    super.key,
    this.width = 0.5,
    this.vertical = 0,
    this.horizontal = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      color: Colors.grey.shade300,
    );
  }
}
