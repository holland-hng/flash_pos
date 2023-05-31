import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ConfirmPickProductButton extends StatelessWidget {
  final Function()? onTap;
  const ConfirmPickProductButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: onTap,
          child: Ink(
            height: 44,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
                child: Text(
              "Confirm",
              style: context.typo.headline6.bold.mergeStyle(
                color: Colors.white,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
