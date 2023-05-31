import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:menu/features/cart/domain/cart_item.dart';
import '../../../category/domain/product.dart';

class ProductPreviewView extends StatelessWidget {
  const ProductPreviewView({
    super.key,
    required this.item,
  });

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageView(thumb: item.product.thumb, width: 60),
          12.0.horizontal,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CartItemHeader(
                  item: item,
                  key: ObjectKey(item),
                ),
                12.0.vertical,
                ...item.pickedDetails.map(
                  (detail) {
                    return _ItemOptionView(
                      detail: detail,
                      key: ValueKey(detail.id),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItemHeader extends StatelessWidget {
  const _CartItemHeader({
    super.key,
    required this.item,
  });

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              "${item.quantity}x ${item.product.name}",
              style: context.typo.subtitle1.semiBold,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "\$${item.price.toStringAsFixed(2)}",
              style: context.typo.subtitle1.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemOptionView extends StatelessWidget {
  final ProductOptionDetail detail;
  const _ItemOptionView({
    super.key,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              detail.name,
              style: context.typo.subtitle2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
            ),
            child: Text(
              "\$${detail.price}",
              style: context.typo.subtitle2,
            ),
          ),
        ],
      ),
    );
  }
}
