import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:menu/features/cart/domain/cart_summary_value.dart';
import 'cart_button.dart';

class CartValueView extends StatelessWidget {
  final Rx<CartSummary> rxCartSummary;
  final Function()? onSave;
  final Function()? onPlaceOrder;
  const CartValueView({
    super.key,
    this.onSave,
    this.onPlaceOrder,
    required this.rxCartSummary,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Obx(() {
        return Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HorDivider(vertical: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total (${rxCartSummary.value.itemCount})",
                      style: context.typo.subtitle2.semiBold),
                  Text(
                    "\$${rxCartSummary.value.total.toStringAsFixed(2)}",
                    style: context.typo.subtitle2.semiBold,
                  ),
                ],
              ),
              22.0.vertical,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CartButton(
                    type: CartButtonEnum.save,
                    onTap: onSave,
                  ),
                  const SizedBox(width: 18),
                  CartButton(
                    type: CartButtonEnum.placeOrder,
                    onTap: onPlaceOrder,
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
