import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:menu/features/category/domain/product.dart';

import 'pick_product_handler.dart';

class ProductOptionView extends StatefulWidget {
  const ProductOptionView({
    super.key,
    required this.pickProductOptionDetailsHandler,
    required this.productOption,
  });

  final PickOptionDetailsHandler pickProductOptionDetailsHandler;
  final ProductOption productOption;

  @override
  State<ProductOptionView> createState() => _ProductOptionViewState();
}

class _ProductOptionViewState extends State<ProductOptionView> {
  late PickOptionDetailsHandler pickProductOptionHandler =
      widget.pickProductOptionDetailsHandler;
  late ProductOption option = widget.productOption;
  late List<ProductOptionDetail> details = option.details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          color: Colors.grey.shade200,
          child: Row(
            children: [
              Text("${option.name} (${option.mode.title})",
                  style: context.typo.headline6.medium.mergeStyle(
                    color: Colors.black54,
                  )),
            ],
          ),
        ),
        ...details.map((detail) {
          return Obx(() {
            final isPicked =
                pickProductOptionHandler.rxPickedDetails.contains(detail);
            return Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  pickProductOptionHandler.pickDetail(detail);
                },
                child: Ink(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detail.name,
                                  style: context.typo.subtitle1.medium,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "\$${detail.price}",
                                  style: context.typo.subtitle2.mergeStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(
                                isPicked
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color:
                                    isPicked ? Colors.blueAccent : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 0.5,
                        color: Colors.grey.shade300,
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        })
      ],
    );
  }
}
