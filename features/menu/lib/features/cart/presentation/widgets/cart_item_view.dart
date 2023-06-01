import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:menu/di/di.dart';
import 'package:menu/features/cart/domain/cart_item.dart';
import 'package:menu/features/category/presentation/widgets/pick_product/pick_product_popup.dart';
import 'package:menu/features/menu/presentation/widgets/main_menu_view/popup_handler.dart';
import '../../../category/domain/product.dart';

class ProductPreviewView extends StatefulWidget {
  const ProductPreviewView({
    super.key,
    required this.item,
    required this.onUpdate,
    required this.onRemove,
  });

  final CartItem item;
  final Function(CartItem) onUpdate;
  final Function() onRemove;

  @override
  State<ProductPreviewView> createState() => _ProductPreviewViewState();
}

class _ProductPreviewViewState extends State<ProductPreviewView> {
  final popupHandler = getIt<PopupHandler>();

  @override
  Widget build(BuildContext context) {
    return Slidable(
      useTextDirection: false,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          12.0.horizontal,
          SlidableAction(
            onPressed: (_) async {
              final result = await popupHandler.showPopup<CartItem>(
                canPop: false,
                context: context,
                builder: (popupContext) {
                  return PickProductPopup(
                    cartItem: widget.item,
                  );
                },
              );
              if (result != null) {
                widget.onUpdate(result);
              }
            },
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            padding: const EdgeInsets.all(0),
            onPressed: (_) {
              widget.onRemove();
            },
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Remove',
          ),
        ],
      ),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(top: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageView(thumb: widget.item.product.thumb, width: 60),
            12.0.horizontal,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CartItemHeader(
                    item: widget.item,
                    key: ObjectKey(widget.item),
                  ),
                  12.0.vertical,
                  ...widget.item.pickedDetails.map(
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
