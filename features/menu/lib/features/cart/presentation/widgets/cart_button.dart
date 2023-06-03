import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final CartButtonEnum type;
  final Function()? onTap;
  const CartButton({
    super.key,
    required this.type,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Ink(
            height: 38,
            decoration: BoxDecoration(
              color: type.backgroundColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(type.title, style: type.textStyle),
            ),
          ),
        ),
      ),
    );
  }
}

enum CartButtonEnum {
  placeOrder,
  save,
}

extension CartButtonEnumExtension on CartButtonEnum {
  String get title {
    switch (this) {
      case CartButtonEnum.placeOrder:
        return "Place order";
      case CartButtonEnum.save:
        return "Save";
      default:
        throw UnimplementedError();
    }
  }

  Color get backgroundColor {
    switch (this) {
      case CartButtonEnum.placeOrder:
        return Colors.blueGrey;
      case CartButtonEnum.save:
        return Colors.grey.shade300;
      default:
        throw UnimplementedError();
    }
  }

  TextStyle get textStyle {
    switch (this) {
      case CartButtonEnum.placeOrder:
        return const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        );
      case CartButtonEnum.save:
        return const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        );
      default:
        throw UnimplementedError();
    }
  }
}
