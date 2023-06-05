import 'package:flutter/material.dart';

class CustomerInfoView extends StatelessWidget {
  const CustomerInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 18 * 3) * 1 / 3;
    return Container(
      width: width,
      color: Colors.transparent,
    );
  }
}
