import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:menu/di/di.dart';
import 'package:menu/features/cart/domain/cart_item.dart';
import 'package:menu/features/category/domain/product.dart';
import 'package:menu/features/category/presentation/widgets/pick_product/pick_product_popup.dart';
import 'package:menu/features/menu/presentation/widgets/main_menu_view/popup_handler.dart';

import '../cart_handler.dart';

class CartItemsListView extends StatefulWidget {
  const CartItemsListView({
    super.key,
    required this.cartHandler,
  });

  final CartHandler cartHandler;

  @override
  State<CartItemsListView> createState() => _CartItemsListViewState();
}

class _CartItemsListViewState extends State<CartItemsListView> {
  final popupHandler = getIt<PopupHandler>();

  late int tabIndex;

  @override
  void didChangeDependencies() {
    tabIndex = DefaultTabController.of(context).index;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = widget.cartHandler.rxCartTabs[tabIndex];
    if (cartItems.isEmpty) {
      return Center(
        key: UniqueKey(),
        child: Assets.gifs.gifEmptyCart.image(),
      );
    }
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey.shade300, Colors.grey.withOpacity(0.05)],
          stops: const [0.9, 1],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: ListView.builder(
        key: PageStorageKey('Tab Cart: $tabIndex'),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Container(
            key: ObjectKey(item),
            padding: const EdgeInsets.only(bottom: 24),
            child: Slidable(
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
                            cartItem: item,
                          );
                        },
                      );
                      if (result != null) {
                        widget.cartHandler.updateItem(index, result);
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
                      widget.cartHandler.removeItem(item);
                    },
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Remove',
                  ),
                ],
              ),
              child: ProductPreviewView(
                item: item,
                key: ObjectKey(item),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductPreviewView extends StatelessWidget {
  const ProductPreviewView({
    super.key,
    required this.item,
  });

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageView(thumb: item.product.thumb, width: 80),
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
