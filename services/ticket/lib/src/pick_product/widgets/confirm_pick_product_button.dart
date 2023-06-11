import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:ticket_service/src/pick_product/pick_product_handler.dart';

class ConfirmPickProductButton extends StatelessWidget {
  final PickProductHandler pickProductHandler;
  const ConfirmPickProductButton({
    super.key,
    required this.pickProductHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HorDivider(),
        18.0.vertical,
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 44,
                  ),
                  padding: const EdgeInsets.only(left: 12, bottom: 14, top: 10),
                  decoration: BoxDecoration(
                    color: context.color.surface,
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Note",
                      style: context.typo.body1.mergeColor(
                        context.color.inactive,
                      ),
                    ),
                  ),
                ),
              ),
              12.0.horizontal,
              _QuantityButton(
                onTap: pickProductHandler.decreaseQuantity,
                iconData: Icons.remove,
                alignment: Alignment.centerRight,
              ),
              SizedBox(
                width: 30,
                child: Center(
                  child: Obx(() {
                    return Text(
                      pickProductHandler.rxQuantity.value.toString(),
                      style: context.typo.subtitle1.semiBold,
                    );
                  }),
                ),
              ),
              _QuantityButton(
                onTap: pickProductHandler.increaseQuantity,
                iconData: Icons.add,
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        ),
        18.0.vertical,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.of(context).pop(pickProductHandler.result);
              },
              child: Ink(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.color.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add to ticket",
                      style: context.typo.subtitle2.bold.mergeStyle(
                        color: context.color.surface,
                      ),
                    ),
                    Obx(() {
                      return Text(
                        " (\$${pickProductHandler.rxPrice.value?.toStringAsFixed(2)})",
                        style: context.typo.subtitle2.bold
                            .mergeStyle(color: context.color.surface),
                        overflow: TextOverflow.ellipsis,
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({
    this.onTap,
    required this.iconData,
    required this.alignment,
  });

  final Function()? onTap;
  final IconData iconData;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        width: 48,
        height: 48,
        padding: iconData == Icons.remove
            ? const EdgeInsets.only(right: 8)
            : const EdgeInsets.only(left: 8),
        child: Align(
          alignment: alignment,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: context.color.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
