import 'package:core_data/core_data.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:ticket_service/src/pick_product/pick_product_handler.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 380,
            ),
            child: Text(
              product.name,
              style: context.typo.subtitle2.bold,
            ),
          ),
          Text(
            "\$${product.price.toStringAsFixed(2)}",
            style: context.typo.subtitle2.bold
                .mergeStyle(color: context.color.primary),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
