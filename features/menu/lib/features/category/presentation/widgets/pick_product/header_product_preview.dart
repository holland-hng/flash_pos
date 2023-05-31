import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:menu/features/category/presentation/widgets/pick_product/pick_product_handler.dart';

import '../../../domain/product.dart';

class HeaderProductPreview extends StatelessWidget {
  const HeaderProductPreview({
    super.key,
    required this.product,
    required this.pickProductHandler,
  });

  final Product product;
  final PickProductHandler pickProductHandler;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        18.0.horizontal,
        ImageView(thumb: product.thumb, width: 150),
        12.0.horizontal,
        Container(
          constraints: const BoxConstraints(minHeight: 168),
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Text(
                      product.name,
                      style: context.typo.headline4.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() {
                    return SizedBox(
                      width: 150,
                      child: Text(
                        "\$${pickProductHandler.rxPrice.value?.toStringAsFixed(2)}",
                        style: context.typo.headline4.bold
                            .mergeStyle(color: Colors.green),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }),
                  SizedBox(
                    height: 66,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                style: context.typo.headline6.semiBold,
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
                  )
                ],
              ),
            ],
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
        height: 54,
        padding: iconData == Icons.remove
            ? const EdgeInsets.only(right: 8)
            : const EdgeInsets.only(left: 8),
        child: Align(
          alignment: alignment,
          child: Container(
            width: 30,
            height: 30,
            color: Colors.blueGrey,
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
