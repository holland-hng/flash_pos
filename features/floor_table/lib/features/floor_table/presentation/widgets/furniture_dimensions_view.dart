import 'package:floor_table/features/floor_table/presentation/controllers/furniture_editor.dart';
import 'package:flutter/material.dart';

import 'furniture_info_textfield.dart';

class FurnitureDimensionsView extends StatelessWidget {
  final String initValue;
  final FurnitureProperty property;
  final Function()? onIncrease;
  final Function()? onDecrease;
  final Function(String)? onSubmitted;

  const FurnitureDimensionsView({
    super.key,
    this.onIncrease,
    this.onDecrease,
    this.initValue = '',
    required this.property,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: FurnitureInfoTextfield(
              initValue: initValue,
              property: property,
              onSubmitted: onSubmitted,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Button(
                    onTap: onDecrease,
                    icon: Icons.remove,
                  ),
                  Container(
                    width: 0.5,
                    height: 30,
                    color: Colors.grey.shade300,
                  ),
                  _Button(
                    onTap: onIncrease,
                    icon: Icons.add,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.onTap,
    required this.icon,
  });

  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap,
        child: Ink(
          height: double.infinity,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    ));
  }
}
